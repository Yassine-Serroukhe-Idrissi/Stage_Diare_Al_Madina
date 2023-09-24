import xlwt
from django.utils import timezone
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
import pdfkit
from django.core.mail import send_mail
from django.urls import reverse
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .models import *
from .forms import *
from users.models import *
from django.db.models import Q
import datetime


# Create your views here.
@login_required(login_url='login')
def demande_chauffeur(request):
    # Si l'utilisateut connecter est superuser
    if request.user.is_superuser:
        p = Paginator(DemandeChauffeur.objects.filter(manager_valider=True), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'chauffeur/alldemandes_admin.html', context)

    # Si l'utilisateut connecter est employee
    elif request.user.is_chauffeur:
        p = Paginator(DemandeChauffeur.objects.filter(chauffeur__user=request.user, status='Confirmer par admin'), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes,
        }
        return render(request, 'chauffeur/alldemande.html', context)
    elif request.user.is_manager:
        p = Paginator(DemandeChauffeur.objects.filter(demandeur__filial=request.user.filial,
                                                      demandeur__departement=request.user.departement), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'chauffeur/alldemandes_manager.html', context)
    else:
        p = Paginator(DemandeChauffeur.objects.filter(demandeur=request.user), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'chauffeur/alldemandes_user.html', context)


# Nouvelle demande de Chauffeur sans l'affectation de chauffeur
@login_required(login_url='login')
def demande_view(request):
    if request.method == "GET":
        form = DemandeChauffeurForme(request.GET or None)
    elif request.method == "POST":
        form = DemandeChauffeurForme(request.POST)
        if form.is_valid():
            demande = form.save(commit=False)
            demande.demandeur = request.user
            if demande.duree_type == 'Jours':
                date_retour = demande.date_deplacement + datetime.timedelta(days=demande.duree)
            elif demande.duree_type == 'Heures':
                date_retour = demande.date_deplacement + datetime.timedelta(hours=demande.duree)
            else:
                date_retour = demande.date_deplacement + datetime.timedelta(minutes=demande.duree)
            demande.date_retour = date_retour
            demande.save()
            request.session['demande_id'] = demande.demande_id
        return redirect('chauffeur-disponible')
    context = {
        "form": form
    }
    return render(request, 'chauffeur/Demande.html', context)


@login_required(login_url='login')
def demande_chauffeur_dispo(request):
    demande_id = request.session['demande_id']
    demande = DemandeChauffeur.objects.get(demande_id=demande_id)
    if request.method == "GET":
        date_deplacement = demande.date_deplacement
        chauffeur_dispo = Chauffeur.objects.exclude(
            Q(reserver__date_reserver__lte=date_deplacement, reserver__date_retour__gt=date_deplacement))
        print(chauffeur_dispo)
        if not chauffeur_dispo:
            demande.delete()
            return render(request, 'chauffeur/NoChauffeur.html')
        else:
            return render(request, 'chauffeur/choix_chauffeur.html', {'chauffeurs': chauffeur_dispo})
    if request.method == 'POST':
        if "cancel" in request.POST:
            demande.delete()
            return redirect('demande-chauffeur')
        else:
            chauffeur = request.POST.get('chauffeur')
            demande.chauffeur_id = chauffeur
            print(chauffeur)
            demande.save()
            return redirect('demande-chauffeur')


def approuver_demande_superieur(request, id):
    demande = get_object_or_404(DemandeChauffeur, pk=id)
    demande.manager_valider = True
    demande.status = 'Confirmer par superieur'
    demande.last_modified = timezone.now()
    demande.save()
    return redirect('demande-chauffeur')


def approuver_demande_admin(request, id):
    demande = get_object_or_404(DemandeChauffeur, pk=id)
    chauffeur = demande.chauffeur
    dates_non_dispo = Reserver.objects.filter(
        Q(date_reserver__lte=demande.date_deplacement, date_retour__gt=demande.date_deplacement,
          chauffeur=chauffeur))
    if dates_non_dispo.exists():
        demande.admin_approuver = True
        demande.manager_valider = True
        demande.status = 'Choisissez nouvelle dates'
        demande.save()
        send_mail(
            f"Veuillez choisir une nouvelle date pour la demande n° {demande.demande_id}",
            f"Veuillez choisir une nouvelle date pour la demande n° {demande.demande_id} \n"
            f"car le chauffeur n'est plus disponible du {demande.date_deplacement} au {demande.date_retour}",
            'noreply.dyaralmadina@gmail.com',
            [demande.demandeur.email],
            fail_silently=False
        )
        return render(request, 'chauffeur/Email_Envoyer.html')
    else:
        demande.admin_approuver = True
        demande.manager_valider = True
        date = Reserver.objects.create(date_reserver=demande.date_deplacement, chauffeur=chauffeur,
                                       date_retour=demande.date_retour, demande=demande)
        chauffeur.reserver.add(date)
        demande.status = 'Confirmer par admin'
        demande.save()
        return redirect('demande-chauffeur')
    return redirect('demande-chauffeur')


def demander_changer_date(request, id):
    demande = get_object_or_404(DemandeChauffeur, pk=id)
    demande.admin_approuver = True
    demande.manager_valider = True
    demande.status = 'Choisissez nouvelle dates'
    chauffeur = demande.chauffeur
    date_reserver = Reserver.objects.filter(chauffeur=chauffeur)
    for r in date_reserver:
        message = "Du " + r.date_reserver.strftime("%d/%m/%Y %H:%M") + " Au " + r.date_retour.strftime(
            "%d/%m/%Y %H:%M") + "\n"
    print(message)
    demande.save()
    send_mail(
        f"Veuillez choisir une nouvelle date pour la demande n° {demande.demande_id}",
        f"Veuillez choisir une nouvelle date pour la demande n° {demande.demande_id} \n"
        f"car le chauffeur n'est plus disponible du {demande.date_deplacement} au {demande.date_retour} \n "
        f"les dates suivantes sont reserver {message}",
        'noreply.dyaralmadina@gmail.com',
        [demande.demandeur.email],
        fail_silently=False
    )
    return render(request, 'chauffeur/Email_Envoyer.html')


def refuser_demande(request, id):
    demande = get_object_or_404(DemandeChauffeur, pk=id)
    chauffeur = demande.chauffeur
    demande.admin_approuver = True
    demande.manager_valider = True
    demande.status = 'Demande annuler'
    demande.save()
    return redirect('demande-chauffeur')


# Code pour generation des fichier pdf pour consulter est imprimer

def generate_PDF(request, id):
    config = pdfkit.configuration(wkhtmltopdf="C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe")
    # Use False instead of output path to save pdf to a variable
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('demande-chauffeur-detail', args=[id])), False,
                          configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="demande.pdf"'

    return response


def view_PDF(request, id=None):
    demande = get_object_or_404(DemandeChauffeur, demande_id=id)
    context = {
        "demande": demande
    }
    return render(request, 'pdf/pdf_template2.html', context)


# Code pour chercher les demandes et pouvoir telecharger sous format .xls

@login_required(login_url='login')
def status_chauffeur(request):
    if request.user.is_chauffeur:
        status = Chauffeur.objects.get(user=request.user).indisponible
        context = {
            'statut': status
        }
        return render(request, 'chauffeur/statut.html', context)
    return redirect(demande_chauffeur)


@login_required(login_url='login')
def changer_status(request):
    if request.user.is_chauffeur:
        chauffeur = Chauffeur.objects.get(user=request.user)
        if chauffeur.indisponible == False:
            chauffeur.indisponible = True
        else:
            chauffeur.indisponible = False
        chauffeur.save()
        return render(request, 'chauffeur/StatuChanger.html')
    return redirect(demande_chauffeur)


@login_required(login_url='login')
def date_reserver_chaffeur(request, id):
    if request.user.is_superuser:
        p = Paginator(Reserver.objects.filter(chauffeur=id), 5)
        page = request.GET.get('page')
        reserver = p.get_page(page)
        chauffeur = Chauffeur.objects.get(user=id)
    return render(request, 'utilisateur/DateReserver.html', {
        "chauffeur": chauffeur,
        "reserver": reserver
    })


@login_required(login_url='login')
def recherche_demande(request):
    if request.method == "POST":
        request.session['datedebut'] = request.POST.get('datedebut')
        request.session['datefin'] = request.POST.get('datefin')
        request.session['status'] = request.POST.get('status')
        return redirect('resultatrecherche-chauffeur')
    else:
        return render(request, 'chauffeur/recherchedemande.html')


@login_required(login_url='login')
def resultat_recherche(request):
    if request.method == "GET":
        datedebut = request.session.get('datedebut')
        datefin = request.session.get('datefin')
        status = request.session.get('status')
        if datedebut < datefin:
            if status == "":
                p = Paginator(DemandeChauffeur.objects.filter(created_on__range=(datedebut, datefin)), 10)
            else:
                p = Paginator(DemandeChauffeur.objects.filter(created_on__range=(datedebut, datefin), status=status),
                              10)
        else:
            if status == "":
                p = Paginator(DemandeChauffeur.objects.filter(created_on__range=(datefin, datefin)), 10)
            else:
                p = Paginator(DemandeChauffeur.objects.filter(created_on__range=(datefin, datefin), status=status), 10)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            'demandes': demandes,
            'datedebut': datedebut,
            'datefin': datefin,
            'status': status
        }
        return render(request, 'chauffeur/resultatrecherche.html', context)
    else:
        request.session['datedebut'] = request.session.get('datedebut')
        request.session['datefin'] = request.session.get('datefin')
        request.session['status'] = request.session.get('status')
        return redirect('recherche-download-chauffeur')


@login_required(login_url='login')
def recherche_download(request):
    datedebut = request.session.get('datedebut')
    datefin = request.session.get('datefin')
    status = request.session.get('status')
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = f'attachment; filename="resultatrecherche.xls"'
    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Demande')
    row_num = 0
    font_style = xlwt.XFStyle()
    font_style.font.bold = True
    columns = ['ID', 'Departement', 'Filial', 'Prenom', 'Nom', 'Date Demande', 'Status', 'Date Modification Status',
               'Date Allez', 'Date Retour', 'Chauffeur']
    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)
    font_style = xlwt.XFStyle()
    print(status)
    if datedebut < datefin:
        if status == "":
            demandes = DemandeChauffeur.objects.filter(created_on__range=(datedebut, datefin)).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'demandeur__first_name',
                'demandeur__last_name', 'created_on', 'status', 'last_modified', 'date_deplacement', 'date_retour',
                'chauffeur__user__username')
        else:
            demandes = DemandeChauffeur.objects.filter(created_on__range=(datedebut, datefin),
                                                       status=status).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'demandeur__first_name',
                'demandeur__last_name', 'created_on', 'status', 'last_modified', 'date_deplacement', 'date_retour',
                'chauffeur__user__username')
    else:
        if status == "":
            demandes = DemandeChauffeur.objects.filter(created_on__range=(datefin, datedebut)).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'demandeur__first_name',
                'demandeur__last_name', 'created_on', 'status', 'last_modified', 'date_deplacement', 'date_retour',
                'chauffeur__user__username')
        else:
            demandes = DemandeChauffeur.objects.filter(created_on__range=(datefin, datedebut),
                                                       status=status).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'demandeur__first_name',
                'demandeur__last_name', 'created_on', 'status', 'last_modified', 'date_deplacement', 'date_retour',
                'chauffeur__user__username')
    for demande in demandes:
        row_num += 1
        for col_num in range(len(demande)):
            if isinstance(demande[col_num], datetime.date):
                date_time = demande[col_num].strftime('%d-%m-%Y ')
                ws.write(row_num, col_num, date_time, font_style)
            elif isinstance(demande[col_num], User):
                demandeur = User.last_name
                ws.write(row_num, col_num, demandeur, font_style)
            else:
                ws.write(row_num, col_num, demande[col_num], font_style)
    wb.save(response)
    return response

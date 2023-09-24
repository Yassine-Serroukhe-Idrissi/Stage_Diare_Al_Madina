import pdfkit
import datetime

import xlwt
from django.contrib.auth.decorators import login_required
from users.models import User, Employee, Manager,Chauffeur
from django.utils import timezone
from django.core.mail import send_mail
from django.core.paginator import Paginator
from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy, reverse
from django.conf import settings

from DemandeMateriel.forms import LineItemFormset, AddItemForm, ItemLivraiFormset, DemandeTermierForm
from DemandeMateriel.models import ItemsList, DemandeModel, Items, BonLivraison, ItemLivrai
from DemandeChauffeur.models import DemandeChauffeur


# Create your views here.
@login_required(login_url='login')
def index(request):
    if request.user.is_superuser:
        context = {
            "demandes_all_count": DemandeModel.objects.all().count(),
            "demandes_chauffeur_count":DemandeChauffeur.objects.all().count(),
            "demandes_chauffeur":DemandeChauffeur.objects.filter().order_by('demande_id')[:3],
            "users_count": User.objects.all().count(),
            "items_count": ItemsList.objects.all().count(),
            "all_first_demandes": DemandeModel.objects.filter().order_by('demande_id')[:3],
        }
        return render(request, 'Index/Index_Admin.html', context)
    if request.user.is_manager:
        context = {
            "demandes_all": DemandeModel.objects.filter(
                demandeur__in=Employee.objects.filter(manager__user=request.user).values('user')),
            "demandes_all_count": DemandeModel.objects.filter(
                demandeur__in=Employee.objects.filter(manager__user=request.user).values('user')).count(),
            "users_count": User.objects.filter(departement=request.user.departement,
                                               filial=request.user.filial).count(),
            "all_first_demande": DemandeModel.objects.filter(
                demandeur__in=Employee.objects.filter(manager__user=request.user).values('user'))[:3],
            "demandes_chauffeur_count": DemandeChauffeur.objects.filter(demandeur=request.user.id).count(),
            "demandes_chauffeur": DemandeChauffeur.objects.filter(demandeur=request.user.id).order_by('demande_id')[:3],
        }
        return render(request, 'Index/Index_Manager.html', context)
    if request.user.is_employee:
        context = {
            "demandes_all_count": DemandeModel.objects.filter(demandeur=request.user.id).count(),
            "all_first_demandes": DemandeModel.objects.filter(demandeur=request.user.id).order_by('demande_id')[:3],
            "demandes_chauffeur_count": DemandeChauffeur.objects.filter(demandeur=request.user.id).count(),
            "demandes_chauffeur": DemandeChauffeur.objects.filter(demandeur=request.user.id).order_by('demande_id')[:3],
        }
        return render(request, 'Index/Index_Employee.html', context)
    if request.user.is_chauffeur:
        context = {
            "chauffeur": Chauffeur.objects.get(user=request.user),
            "demandes_all_count": DemandeModel.objects.filter(demandeur=request.user.id).count(),
            "all_first_demandes": DemandeChauffeur.objects.filter(chauffeur__user=request.user).order_by('demande_id')[:3]

        }
        return render(request, 'Index/Index_Chauffeur.html', context)

@login_required(login_url='login')
def chauffeur_list(request):
    if request.user.is_superuser:
        p = Paginator(Chauffeur.objects.filter(user__is_chauffeur=True),5)
        page = request.GET.get('page')
        users = p.get_page(page)
        context = {
            "users": users,
        }
        return render(request,'utilisateur/allchauffeur.html',context)
    return redirect(index)



@login_required(login_url='login')
def all_users(request):
    if request.user.is_superuser:
        p = Paginator(User.objects.all(), 5)
        page = request.GET.get('page')
        users = p.get_page(page)
        context = {
            "users": users
        }
        return render(request, 'utilisateur/allusers.html', context)
    elif request.user.is_manager:
        p = Paginator(User.objects.filter(departement=request.user.departement, filial=request.user.filial), 5)
        page = request.GET.get('page')
        users = p.get_page(page)
        context = {
            "users": users
        }
        return render(request, 'utilisateur/allusers.html', context)
    else:
        return render(request, 'Index/Index_Employee.html')


@login_required(login_url='login')
def demande_view(request):
    if request.method == "GET":
        formset = LineItemFormset(request.GET or None)
    elif request.method == "POST":
        formset = LineItemFormset(request.POST)
        if formset.is_valid():
            demande = DemandeModel.objects.create(demandeur=request.user)
            i = 0
            for form in formset:
                name = form.cleaned_data.get('name')
                contite = form.cleaned_data.get('contite')
                delete = request.POST.get(f'form-{i}-DELETE')
                if name and contite and delete is None:
                    Items(name=name,
                          contite=contite,
                          demande=demande).save()
                i += 1
            demande.save()
            if request.user.is_employee:
                mail_manager = Manager.objects.get(
                    user__in=Employee.objects.filter(user=request.user).values('manager')).user.email
            else:
                mail_manager = request.user.email
            send_mail(
                f"Nouvele demande de materielle : demande n° {demande.demande_id}",
                f"Nouvele demande de materielle : demande n° {demande.demande_id} Pour voir la demande \n"
                f"clicker ici http://127.0.0.1:8000/demande-detail/{demande.demande_id}",
                'noreply.dyaralmadina@gmail.com',
                [mail_manager, 'siyyass678@gmail.com'],
                fail_silently=False
            )
            try:
                generate_PDF(request, id=demande.id)
            except Exception as e:
                print(f"********{e}********")
            return redirect(reverse_lazy("alldemandes"))
    context = {"formset": formset,
               }
    return render(request, 'demandes/Demande.html', context)


def generate_PDF(request, id):
    config = pdfkit.configuration(wkhtmltopdf="C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe")
    # Use False instead of output path to save pdf to a variable
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('demande-detail', args=[id])), False, configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="demande.pdf"'

    return response


@login_required(login_url='login')
def addItem(request):
    if request.method == "GET":
        last_item = ItemsList.objects.last()
        form = AddItemForm(request.GET or None)
    elif request.method == "POST":
        form = AddItemForm(request.POST)
        if form.is_valid():
            item = ItemsList.objects.create(name=form.data["name"])
            item.save()
            return redirect(reverse_lazy("addItem"))
    context = {"form": form,
               "last_item": last_item
               }
    return render(request, 'materiel/AddItem.html', context)


def view_PDF(request, id=None):
    demande = get_object_or_404(DemandeModel, demande_id=id)
    items = demande.items_set.all()
    context = {
        "demande": demande,
        "listItems": items
    }
    return render(request, 'pdf/pdf_template.html', context)


@login_required(login_url='login')
def all_demandes(request):
    if request.user.is_superuser:
        p = Paginator(DemandeModel.objects.all(), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'demandes/alldemandes.html', context)
    elif request.user.is_manager:
        p = Paginator(DemandeModel.objects.filter(
            demandeur__in=Employee.objects.filter(manager__user=request.user).values('user')), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'demandes/alldemandes_manager.html', context)
    else:
        p = Paginator(DemandeModel.objects.filter(demandeur=request.user.id), 5)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            "demandes": demandes
        }
        return render(request, 'demandes/alldemandes_user.html', context)


@login_required(login_url='login')
def all_materiel(request):
    if request.user.is_superuser:
        p = Paginator(ItemsList.objects.all(), 5)
        page = request.GET.get('page')
        items = p.get_page(page)
        context = {
            "items": items
        }
        return render(request, 'materiel/allmateriel.html', context)
    else:
        return render(request, 'Index/Index_Admin.html')


@login_required(login_url='login')
def recherche_demande(request):
    if request.method == "POST":
        request.session['datedebut'] = request.POST.get('datedebut')
        request.session['datefin'] = request.POST.get('datefin')
        request.session['status'] = request.POST.get('status')
        return redirect('resultatrecherche')
    else:
        return render(request, 'demandes/recherchedemande.html')


@login_required(login_url='login')
def resultat_recherche(request):
    if request.method == "GET":
        datedebut = request.session.get('datedebut')
        datefin = request.session.get('datefin')
        status = request.session.get('status')
        print(status)
        if datedebut < datefin :
            if status == "":
                p = Paginator(DemandeModel.objects.filter(created_on__range=(datedebut, datefin)), 10)
            else:
                p = Paginator(DemandeModel.objects.filter(created_on__range=(datedebut, datefin), status=status), 10)
        else:
            if status == "":
                p = Paginator(DemandeModel.objects.filter(created_on__range=(datefin, datedebut)), 10)
            else :
                p = Paginator(DemandeModel.objects.filter(created_on__range=(datefin,datedebut), status=status), 10)
        page = request.GET.get('page')
        demandes = p.get_page(page)
        context = {
            'demandes': demandes,
            'datedebut': datedebut,
            'datefin': datefin,
            'status':status
        }
        return render(request, 'demandes/resultatrecherche.html', context)
    else:
        request.session['datedebut'] = request.session.get('datedebut')
        request.session['datefin'] = request.session.get('datefin')
        request.session['status'] = request.session.get('status')
        return redirect(recherche_download)


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
    columns = ['ID', 'Departement', 'Filial', 'Date Demande', 'Status', 'Date Modification Status']
    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)
    font_style = xlwt.XFStyle()
    if datedebut < datefin:
        if status == "":
            demandes = DemandeModel.objects.filter(created_on__range=(datedebut, datefin)).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'created_on', 'status',
                'last_modified')
        else:
            demandes = DemandeModel.objects.filter(created_on__range=(datedebut, datefin), status=status).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'created_on', 'status',
                'last_modified')
    else:
        if status == "":
            demandes = DemandeModel.objects.filter(created_on__range=(datefin, datedebut)).values_list(
                "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'created_on', 'status',
                'last_modified')
        else:
            demandes = DemandeModel.objects.filter(created_on__range=(datefin, datedebut), status=status).values_list(
            "demande_id", "demandeur__departement__name", "demandeur__filial__name", 'created_on', 'status',
            'last_modified')
    print(demandes)
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

def approuver_demande_superieur(request, id):
    demande = get_object_or_404(DemandeModel, pk=id)
    demande.manager_valider = True
    demande.last_modified = timezone.now()
    demande.status = 'Confirmer par superieur'
    demande.save()
    return redirect('alldemandes')


def view_pdf_bl(request, id):
    demande = get_object_or_404(DemandeModel, demande_id=id)
    bl = demande.bonlivraison_set.get()
    items = demande.items_set.all()
    itemlivrai = bl.itemlivrai_set.all()
    context = {
        "demande": demande,
        "bonlivraison": bl,
        "items": items,
        "itemlivrai": itemlivrai
    }
    return render(request, 'pdf/pdf_bl.html', context)


def generate_PDF_bl(request, id):
    config = pdfkit.configuration(wkhtmltopdf="C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe")
    # Use False instead of output path to save pdf to a variable
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('bl-detail', args=[id])), False, configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="BonLivraison.pdf"'

    return response


def appprouver_admin(request, id):
    demande = get_object_or_404(DemandeModel, pk=id)
    items = demande.items_set.all()
    if request.method == "GET":
        formset = ItemLivraiFormset(request.GET or None)
    elif request.method == "POST":
        formset = ItemLivraiFormset(request.POST)
        if formset.is_valid():
            commentaire = request.POST.get("commentaire")
            bl = BonLivraison.objects.create(demande=demande,commentaire=commentaire)
            print(bl)
            i = 0
            for form in formset:
                name = form.cleaned_data.get('name')
                contite = form.cleaned_data.get('contite')
                delete = request.POST.get(f'form-{i}-DELETE')
                if name and contite and delete is None:
                    ItemLivrai(name=name, contite=contite, bonlivraison=bl).save()
                i += 1
            bl.save()
            demande.last_modified = timezone.now()
            demande.status = 'Confirmer par admin'
            demande.save()
            send_mail(
                f"Votre demande de materielle {demande.demande_id}a ete traité . ",
                f"Votre demande de materielle {demande.demande_id}a ete traité . \n"
                f" Veuillez verifier le bon de livraison est clôturer votre demande",
                'noreply.dyaralmadina@gmail.com',
                [demande.demandeur.email, 'siyyass678@gmail.com'],
                fail_silently=False
            )
            demande.admin_valider = True
            demande.save()
            try:
                generate_PDF_bl(request, id=demande.id)
            except Exception as e:
                print(f"********{e}********")
            return redirect(reverse_lazy("alldemandes"))
    context = {"formset": formset,
               "demande": demande,
               "items": items}
    return render(request, 'demandes/approuver-admin.html', context)


def demande_terminer(request, id):
    demande = get_object_or_404(DemandeModel, pk=id)
    items = demande.items_set.all()
    bl = demande.bonlivraison_set.get()
    itemlivrai = bl.itemlivrai_set.all()
    if request.method == "GET":
        form = DemandeTermierForm(request.GET or None)
    if request.method == "POST":
        form = DemandeTermierForm(request.POST)
        if form.is_valid():
            commentaire = form.cleaned_data.get('commentaire')
            demande.commentaire = commentaire
            demande.terminer = True
            demande.last_modified = timezone.now()
            demande.status = "Cloturer"
            demande.save()
            return redirect(reverse_lazy("alldemandes"))
    context = {
        "demande": demande,
        "bonlivraison": bl,
        "items": items,
        "itemlivrai": itemlivrai,
        "form": form
    }
    return render(request, 'demandes/terminer-demande.html', context)


def error_404_view(request, exception):
    # nous ajoutons le chemin vers le fichier 404.html
    # ici. Le nom de notre fichier HTML est 404.html
    return render(request, '404.html')

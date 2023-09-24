from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.index, name="index"),
    path('demande/', views.demande_view, name="demande"),
    path('demande-detail/<id>', views.view_PDF, name='demande-detail'),
    path('additem/', views.addItem, name="addItem"),
    path('demande-download/<id>', views.generate_PDF, name='demande-download'),
    path('alldemandes/', views.all_demandes, name='alldemandes'),
    path('allmateriels/', views.all_materiel, name='allmateriels'),
    path('allusers/', views.all_users, name='allusers'),
    path('allchauffeur/', views.chauffeur_list, name='allchauffeur'),
    path('recherche-demande/', views.recherche_demande, name="recherchedemande"),
    path('resultat-recherche/', views.resultat_recherche, name="resultatrecherche"),
    path('recherche-download/', views.recherche_download, name='recherche-download'),
    path('approuver_superieur/<id>', views.approuver_demande_superieur, name='approuver_superieur'),
    path('approuver_admin/<id>', views.appprouver_admin, name='approuver_admin'),
    path('bonlivraison/<id>', views.view_pdf_bl, name='bl-detail'),
    path('bl-download/<id>', views.generate_PDF_bl, name='bl-download'),
    path('demande_terminer/<id>', views.demande_terminer, name='demande_terminer'),

]

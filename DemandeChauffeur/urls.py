from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('alldemande-chauffeur/', views.demande_chauffeur, name="demande-chauffeur"),
    path('demande-chauffeur-detail/<id>', views.view_PDF, name='demande-chauffeur-detail'),
    path('demande-download/<id>', views.generate_PDF, name='demande-chauffeur-download'),
    path('demande/', views.demande_view, name='new-demande-chauffeur'),
    path('recherche-demande/', views.recherche_demande, name="recherchedemande-chauffeur"),
    path('resultat-recherche/', views.resultat_recherche, name="resultatrecherche-chauffeur"),
    path('recherche-download/', views.recherche_download, name='recherche-download-chauffeur'),
    path('approuver/<id>/', views.approuver_demande_admin, name='approuver_demande'),
    path('changer-date/<id>/', views.demander_changer_date, name='changer-date'),
    path('refuser/<id>/', views.refuser_demande, name='refuser_demande'),
    path('chauffeur-disponible/', views.demande_chauffeur_dispo, name='chauffeur-disponible'),
    path('chauffeur-statut/', views.status_chauffeur, name='chauffeur-statut'),
    path('changer-statut/', views.changer_status, name='changer-statut'),
    path('date-reserver/<id>',views.date_reserver_chaffeur,name='date-reserver'),
    path('recherche-demande/', views.recherche_demande, name="recherchedemande-chauffeur"),
    path('resultat-recherche/', views.resultat_recherche, name="resultatrecherche-chauffeur"),
    path('recherche-download/', views.recherche_download, name='recherche-download-chauffeur'),
    path('approuver_superieur/<id>', views.approuver_demande_superieur, name='approuver_superieur-chauffeur'),

]

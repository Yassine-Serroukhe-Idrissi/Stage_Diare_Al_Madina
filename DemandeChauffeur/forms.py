from django import forms
from . import models


class DemandeChauffeurForme(forms.ModelForm):
    class Meta:
        model = models.DemandeChauffeur
        fields = ['date_deplacement', 'lieu_deplacement', 'coordonees', 'mission', 'duree','duree_type']
        widgets = {
            'mission': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'date_deplacement': forms.DateInput(
                attrs={'type': 'datetime-local','class': 'form-control',
                       'name': 'date_deplacement','id': 'id_date_deplacement', }),
            'lieu_deplacement': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'coordonees': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'duree': forms.NumberInput(attrs={'class': 'form-control'}),
            'duree_type':forms.Select(attrs={'class': 'custom-select mr-sm-2'})
        }
        labels = {
            'cordonnées': 'Société / Nom et cordonnées du destinataire (Adresse / Téléphone) :',
            'duree': 'Durée estimée (Aller / retour) en heures ou minutes ou jours:',
            'lieu_deplacement': 'Lieu de deplacement :',
            'date_deplacement':'Date de deplacement :',
        }

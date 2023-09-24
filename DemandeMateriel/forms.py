from django.contrib.auth.forms import UserCreationForm
from django.forms import formset_factory
from djangoformsetjs.utils import formset_media_js

from . import models
from django import forms


class ItemForm(forms.ModelForm):
    class Meta:
        model = models.Items
        fields = ["name", "contite"]
        widgets = {
            'contite': forms.NumberInput(attrs={'class': 'form-control'}),
            'name': forms.Select(attrs={'class': 'custom-select mr-sm-2'})
        }
        labels = {
            "name": "Nom Produit",
            'contite': "Quantite"
        }
        js = formset_media_js


class AddItemForm(forms.ModelForm):
    class Meta:
        model = models.ItemsList
        fields = ["name"]
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nom'}),
        }
        labels = {
            'name': "Nom Produit"
        }


class ItemLivraiForm(forms.ModelForm):
    class Meta:
        model = models.ItemLivrai
        fields = ["name", "contite"]
        widgets = {
            'contite': forms.NumberInput(attrs={'class': 'form-control'}),
            'name': forms.Select(attrs={'class': 'custom-select mr-sm-2'})
        }
        labels = {
            "name": "Nom Produit",
            'contite': "Quantite"
        }
        js = formset_media_js


ItemLivraiFormset = formset_factory(ItemLivraiForm, extra=1, can_delete=True)

LineItemFormset = formset_factory(ItemForm, extra=1, can_delete=True)


class DemandeTermierForm(forms.ModelForm):
    class Meta:
        model = models.DemandeModel
        fields = ['commentaire']
        widgets = {
            'commentaire': forms.TextInput(attrs={'class': 'form-control'}),
        }
        labels = {
            "commentaire": "Commentaire",
        }

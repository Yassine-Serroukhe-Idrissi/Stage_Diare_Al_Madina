from django.contrib import admin
from .models import ItemsList, Items, DemandeModel, Departement, Filial, BonLivraison, ItemLivrai

# Register your models here.
admin.site.register(Items)
admin.site.register(DemandeModel)
admin.site.register(ItemsList)
admin.site.register(Departement)
admin.site.register(Filial)
admin.site.register(BonLivraison)
admin.site.register(ItemLivrai)

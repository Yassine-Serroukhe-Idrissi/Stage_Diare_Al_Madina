# Create your models here.

# from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone

from users.models import User


# Filial Model
class Filial(models.Model):
    filial_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


# Departement Model

class Departement(models.Model):
    departement_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


# UserCustom


class ItemsList(models.Model):
    item_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class DemandeModel(models.Model):
    demande_id = models.AutoField(primary_key=True)
    demandeur = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    created_on = models.DateField(auto_now_add=True)
    status_type = (
        ('Nouvelle Demande', 'Nouvelle Demande'),
        ('Confirmer par superieur', 'Confirmer par superieur'),
        ('Confirmer par admin', 'Confirmer par admin'),
        ('Cloturer', 'Cloturer')
    )
    status = models.CharField(max_length=50, default='Nouvelle Demande', choices=status_type)
    manager_valider = models.BooleanField(default=False)
    admin_valider = models.BooleanField(default=False)
    terminer = models.BooleanField(default=False)
    commentaire = models.CharField(max_length=500, null=True, blank=True)
    last_modified = models.DateField()

    def save(self, *args, **kwargs):
        if not self.demande_id:
            self.last_modified = timezone.now()
        return super(DemandeModel, self).save(*args, **kwargs)

    def __str__(self):
        return f'Demande n°{self.demande_id} : {self.created_on.strftime("%b %d %I: %M %p")}'


class Items(models.Model):
    item_id = models.AutoField(primary_key=True)
    name = models.ForeignKey(ItemsList, on_delete=models.CASCADE, null=True)
    contite = models.IntegerField()
    demande = models.ForeignKey(DemandeModel, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return format(self.name.name)


class BonLivraison(models.Model):
    bl_id = models.AutoField(primary_key=True)
    demande = models.ForeignKey(DemandeModel, on_delete=models.CASCADE, null=True)
    commentaire = models.CharField(max_length=500, null=True, blank=True)

    def __str__(self):
        return f'BL {self.bl_id} ' + f' pour la demande {self.demande.demande_id}'


class ItemLivrai(models.Model):
    item_id = models.AutoField(primary_key=True)
    name = models.ForeignKey(ItemsList, on_delete=models.CASCADE, null=True)
    contite = models.IntegerField()
    bonlivraison = models.ForeignKey(BonLivraison, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return f'Item pout BL {self.bonlivraison.pk} {self.name}'

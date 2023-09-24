from django.contrib.auth.models import AbstractUser
from django.db import models


# Create your models here.

class User(AbstractUser):
    departement = models.ForeignKey('DemandeMateriel.Departement', on_delete=models.CASCADE, null=True)
    filial = models.ForeignKey('DemandeMateriel.Filial', on_delete=models.CASCADE, null=True)
    is_employee = models.BooleanField(default=False)
    is_manager = models.BooleanField(default=False)
    is_chauffeur = models.BooleanField(default=False)


class Manager(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name="Manager")

    def __str__(self):
        return f'Manager {self.user.last_name}  {self.user.first_name}'


class Employee(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name="Employee")
    manager = models.ForeignKey(Manager, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f'Employee {self.user.last_name}  {self.user.first_name}'


class Chauffeur(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name="Chauffeur")
    reserver = models.ManyToManyField('DemandeChauffeur.Reserver',blank=True,related_name='Reserver')
    indisponible = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.user.last_name} {self.user.first_name}'

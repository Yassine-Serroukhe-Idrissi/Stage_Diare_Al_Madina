from django.db import models
from django.utils import timezone
from users.models import User, Chauffeur
from users.tasks import set_chauffeur_as_indisponible, set_chauffeur_as_disponible


class DemandeChauffeur(models.Model):
    demande_id = models.AutoField(primary_key=True)
    demandeur = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    chauffeur = models.ForeignKey(Chauffeur, null=True, blank=True, on_delete=models.SET_NULL)
    reserve = models.BooleanField(default=False)
    created_on = models.DateField(auto_now_add=True)
    date_deplacement = models.DateTimeField()
    date_retour = models.DateTimeField()
    admin_approuver = models.BooleanField(default=False)
    manager_valider = models.BooleanField(default=False)
    lieu_deplacement = models.CharField(max_length=500, blank=False)
    coordonees = models.CharField(max_length=200, blank=False)
    mission = models.CharField(max_length=200, blank=False)
    duree = models.IntegerField()
    type_dure = (
        ('Jours', 'Jours'),
        ('Heures', 'Heures'),
        ('Minutes', 'Minutes')
    )
    duree_type = models.CharField(max_length=8, choices=type_dure, default='Minutes')
    last_modified = models.DateField()
    status_type = (
        ('Nouvelle Demande', 'Nouvelle Demande'),
        ('Confirmer par admin', 'Confirmer par admin'),
        ('Confirmer par Superieur', 'Confirmer par Superieur'),
        ('Demande annuler', 'Demande annuler'),
        ('Choisissez nouvelle dates', 'Choisissez nouvelle dates'),
    )
    status = models.CharField(max_length=50, default='Nouvelle Demande', choices=status_type)

    def save(self, *args, **kwargs):
        if not self.demande_id:
            self.last_modified = timezone.now()
        return super(DemandeChauffeur, self).save(*args, **kwargs)

    def __str__(self):
        return f'Demande n°{self.demande_id} : {self.created_on}'


class Reserver(models.Model):
    date_reserver = models.DateTimeField()
    date_retour = models.DateTimeField()
    chauffeur = models.ForeignKey(Chauffeur, on_delete=models.CASCADE, null=True, related_name='Chauffeur')
    demande = models.ForeignKey(DemandeChauffeur, on_delete=models.CASCADE, null=True, related_name='DemandeChauffeur')

    def save(self, *args, **kwargs):
        create_task = False
        if self.pk is None:
            create_task = True
        super(Reserver, self).save(*args, **kwargs)
        if create_task:
            set_chauffeur_as_indisponible.apply_async(args=[self.chauffeur.user.id], eta=self.date_reserver)
            set_chauffeur_as_disponible.apply_async(args=[self.chauffeur.user.id], eta=self.date_retour)

    def __str__(self):
        return f'{self.date_reserver}'

from celery import shared_task
from users.models import Chauffeur


@shared_task
def set_chauffeur_as_indisponible(id):
    chauffeur = Chauffeur.objects.get(user=id)
    print(chauffeur.indisponible)
    chauffeur.indisponible = True
    chauffeur.save()
    print(chauffeur.indisponible)

@shared_task
def set_chauffeur_as_disponible(id):
    chauffeur = Chauffeur.objects.get(user=id)
    print(chauffeur.indisponible)
    chauffeur.indisponible = False
    chauffeur.save()
    print(chauffeur.indisponible)
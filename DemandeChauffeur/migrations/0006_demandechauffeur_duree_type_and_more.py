# Generated by Django 4.2.2 on 2023-08-22 14:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('DemandeChauffeur', '0005_reserver_demande'),
    ]

    operations = [
        migrations.AddField(
            model_name='demandechauffeur',
            name='duree_type',
            field=models.CharField(choices=[('Jours', 'Jours'), ('Heures', 'Heures'), ('Minutes', 'Minutes')], default='Minutes', max_length=8),
        ),
        migrations.AlterField(
            model_name='demandechauffeur',
            name='coordonees',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='demandechauffeur',
            name='duree',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='demandechauffeur',
            name='lieu_deplacement',
            field=models.CharField(max_length=500),
        ),
        migrations.AlterField(
            model_name='demandechauffeur',
            name='mission',
            field=models.CharField(max_length=200),
        ),
    ]

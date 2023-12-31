# Generated by Django 4.2.2 on 2023-08-23 09:20

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('DemandeChauffeur', '0008_alter_reserver_date_reserver'),
    ]

    operations = [
        migrations.AddField(
            model_name='demandechauffeur',
            name='date_retour',
            field=models.DateTimeField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='reserver',
            name='date_retour',
            field=models.DateTimeField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]

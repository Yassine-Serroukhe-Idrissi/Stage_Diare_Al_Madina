# Generated by Django 4.2.2 on 2023-08-17 14:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BonLivraison',
            fields=[
                ('bl_id', models.AutoField(primary_key=True, serialize=False)),
                ('commentaire', models.CharField(blank=True, max_length=500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='DemandeModel',
            fields=[
                ('demande_id', models.AutoField(primary_key=True, serialize=False)),
                ('created_on', models.DateField(auto_now_add=True)),
                ('status', models.CharField(choices=[('Nouvelle Demande', 'Nouvelle Demande'), ('Confirmer par superieur', 'Confirmer par superieur'), ('Confirmer par admin', 'Confirmer par admin'), ('Cloturer', 'Cloturer')], default='Nouvelle Demande', max_length=50)),
                ('manager_valider', models.BooleanField(default=False)),
                ('admin_valider', models.BooleanField(default=False)),
                ('terminer', models.BooleanField(default=False)),
                ('commentaire', models.CharField(blank=True, max_length=500, null=True)),
                ('last_modified', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Departement',
            fields=[
                ('departement_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Filial',
            fields=[
                ('filial_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='ItemsList',
            fields=[
                ('item_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Items',
            fields=[
                ('item_id', models.AutoField(primary_key=True, serialize=False)),
                ('contite', models.IntegerField()),
                ('demande', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='DemandeMateriel.demandemodel')),
                ('name', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='DemandeMateriel.itemslist')),
            ],
        ),
        migrations.CreateModel(
            name='ItemLivrai',
            fields=[
                ('item_id', models.AutoField(primary_key=True, serialize=False)),
                ('contite', models.IntegerField()),
                ('bonlivraison', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='DemandeMateriel.bonlivraison')),
                ('name', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='DemandeMateriel.itemslist')),
            ],
        ),
    ]

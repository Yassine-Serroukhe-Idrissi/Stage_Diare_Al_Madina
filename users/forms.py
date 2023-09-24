from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms
from .models import User, Manager, Employee, Chauffeur


class CreateUserForm(UserCreationForm):
    password1 = forms.CharField(label='Mot de passe', widget=forms.PasswordInput(
        attrs={"class": "form-control", "placeholder": "Mot de passe"}))
    password2 = forms.CharField(label='Confirmer mot de passe', widget=forms.PasswordInput(
        attrs={"class": "form-control", "placeholder": "Confirmez mot de passe"}))

    class Meta:
        model = User
        fields = ['last_name', 'first_name', 'email', 'password1', 'password2', 'filial', 'departement',
                  'is_superuser', 'is_manager', 'is_employee', 'is_chauffeur']
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Prenom'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nom'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'filial': forms.Select(attrs={'class': 'custom-select mr-sm-2'}),
            'departement': forms.Select(attrs={'class': 'custom-select mr-sm-2'}),

        }
        labels = {
            'first_name': "Prenom",
            'last_name': "Nom",
            'email': "Email",
            'password1': "Mot de passe",
            'password2': "",
            'is_superuser': 'Admin',
            'is_manager': 'Responsable',
            'is_employee': 'Employee',
            'is_chauffeur': 'Chauffeur',

        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields["password2"].widget.attrs.update({
            "class": "form-control",
        })

    def save(self, commit=False):
        user = super().save()
        if user.is_employee == True:
            print("Test")
            manager = Manager.objects.filter(user__departement=user.departement, user__filial=user.filial).first()
            if not manager:
                Employee.objects.create(user=user)
            else:
                Employee.objects.create(user=user, manager=manager)
        if user.is_manager == True:
            manager = Manager.objects.create(user=user)
            Employee.objects.create(user=user, manager=manager)
            employee = Employee.objects.filter(user__departement=user.departement, user__filial=user.filial)
            print(employee)
            for e in employee:
                e.manager = manager
                e.save()
        if user.is_chauffeur == True:
            chauffeur = Chauffeur.objects.create(user=user)
        return user


class EditProfileForm(UserChangeForm):
    class Meta:
        model = User
        fields = ['last_name', 'first_name', 'email', 'filial', 'departement', 'is_superuser', 'is_manager',
                  'is_employee', 'is_chauffeur']
        exclude = ['password']
        widgets = {
            'first_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Prenom'}),
            'last_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nom'}),
            'email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Email'}),
            'filial': forms.Select(attrs={'class': 'custom-select mr-sm-2'}),
            'departement': forms.Select(attrs={'class': 'custom-select mr-sm-2'}),

        }
        labels = {
            'first_name': "Prenom",
            'last_name': "Nom",
            'email': "Email",
            'is_superuser': 'Admin',
            'is_manager': 'Responsable',
            'is_employee': 'Employee',
            'is_chauffeur': 'Chauffeur',

        }

    def save(self, commit=False):
        user = super().save()
        user.username = user.email
        return user


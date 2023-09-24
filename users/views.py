from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from .forms import CreateUserForm,EditProfileForm
from .models import User
from django.contrib.auth.forms import AuthenticationForm, UserChangeForm, PasswordChangeForm, SetPasswordForm


# Create your views here.

def login_view(request):
    if request.user.is_authenticated:
        return redirect('index')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            form = login(request, user)
            messages.success(request, '')
            return redirect('index')
        else:
            messages.error(request, "Nom d'utilisateur ou Mote de passe incorect")
    form = AuthenticationForm
    return render(request, 'utilisateur/Login.html', {'form': form,
                                                      "mesages": messages})


@login_required(login_url='login')
def logoutUser(request):
    logout(request)
    return redirect('login')


@login_required(login_url='login')
def register_view(request):
    form = CreateUserForm()
    if request.user.is_superuser:
        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.instance.username = form.cleaned_data.get('email')
                form.save()
                """groups = Group.objects.get(name=form.cleaned_data.get('group'))
                users.groups.add(groups)"""
                user = form.cleaned_data.get('first_name')
                messages.success(request, f'Account was created for {user}')
                return redirect('login')
        context = {'form': form}
        return render(request, 'utilisateur/Register.html', context)
    else:
        return redirect('index')


@login_required(login_url='login')
def profile(request):
    context = {
        'user': request.user
    }
    return render(request, 'utilisateur/profile.html', context)


@login_required(login_url='login')
def edit_profile(request, id):
    user = get_object_or_404(User, pk=id)
    if request.user.is_superuser:
        if request.method == 'POST':
            form = EditProfileForm(request.POST, instance=user)
            if form.is_valid():
                form.instance.username = form.cleaned_data.get('email')
                form.save()
                return redirect('allusers')
        else:
            form = EditProfileForm(instance=user)
            context = {
                'form': form
            }
        return render(request, 'utilisateur/edit_profile.html', context)
    else:
        return redirect('index')

@login_required(login_url='login')
def change_password(request, id):
    user = get_object_or_404(User, pk=id)
    if request.user.is_superuser:
        if request.method == 'POST':
            form = SetPasswordForm(user=user,data=request.POST)
            if form.is_valid():
                form.save()
                update_session_auth_hash(request,form.user)
                return redirect('allusers')
        else:
            form = SetPasswordForm(user=user)
        context = {
            'form': form
        }
        return render(request, 'utilisateur/edit_profile.html', context)
    else:
        return redirect('index')
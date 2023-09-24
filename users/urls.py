from django.urls import path, include

from . import views

urlpatterns = [
    path('login',views.login_view, name="login"),
    path('logout',views.logoutUser,name="logout"),
    path('register',views.register_view,name="register"),
    path('profile',views.profile,name="profile"),
    path('edit-profime/<id>',views.edit_profile,name="edit-profile"),
    path('password-change/<id>',views.change_password, name="password-change")
]
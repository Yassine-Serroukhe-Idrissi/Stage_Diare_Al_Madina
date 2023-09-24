from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('DemandeMateriel.urls')),
    path('user/',include('users.urls')),
    path('chauffeur/',include('DemandeChauffeur.urls')),

]
handler404 = 'DemandeMateriel.views.error_404_view'

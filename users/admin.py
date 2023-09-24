from django.contrib import admin
from .models import User, Manager, Employee, Chauffeur

# Register your models here.

admin.site.register(User)
admin.site.register(Manager)
admin.site.register(Employee)
admin.site.register(Chauffeur)

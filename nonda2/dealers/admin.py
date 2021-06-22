from django.contrib import admin

from .models import Dealers, Transaction, Units
# Register your models here.

admin.site.register(Dealers)
admin.site.register(Transaction)
admin.site.register(Units)
from django.contrib import admin

from .models import Vehicle, Models, Brands, Units, Colors, Transaction
# Register your models here.
admin.site.register(Vehicle)
admin.site.register(Models)
admin.site.register(Brands)
admin.site.register(Units)
admin.site.register(Colors)
admin.site.register(Transaction)
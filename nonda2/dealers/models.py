from django.db import models
from django.conf import settings
from djmoney.models.fields import MoneyField

# Create your models here.
class Dealers(models.Model):
    DealerName = models.CharField(max_length=50)
    DealerDesc = models.TextField(max_length=1024)
    DealerBrand = models.ForeignKey("manufactures.Brands", on_delete=models.CASCADE, null=True)
    DealerBanner = models.ImageField(upload_to="dealers/banner/%Y/%m/%d/", height_field=None, width_field=None, max_length=None, blank=True, null=True)
    DealerLogo = models.ImageField(upload_to="dealers/logo/%Y/%m/%d/", height_field=None, width_field=None, max_length=None, blank=True)
    DealerAdmin = models.ForeignKey("accounts.User", limit_choices_to={'is_dealer': True, 'is_hire': False}, on_delete=models.CASCADE)
    DealerSlug = models.SlugField(null=True)

    def __str__(self):
        return self.DealerName

class Units(models.Model):
    Vin = models.ForeignKey("manufactures.Units", on_delete=models.CASCADE, related_name='dealers_units_vehicle_identification_number', null=True)
    is_sell = models.BooleanField(default=False)
    Colors = models.CharField(max_length=50, default="black")
    Owner = models.ForeignKey(Dealers, on_delete=models.CASCADE,related_name="dealers_units_owner", null=True)
    Buyers = models.ForeignKey(settings.AUTH_USER_MODEL, limit_choices_to={'is_customer': True}, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return str(self.Vin)

class Transaction(models.Model):
    is_buy = models.BooleanField(default=False, null=True)
    is_sell = models.BooleanField(default=False, null=True)
    Vin = models.ForeignKey("manufactures.Units", on_delete=models.CASCADE, null=True)
    DateBuy = models.DateTimeField(auto_now=False, auto_now_add=True, null=True)
    DateSell = models.DateField(auto_now=False, auto_now_add=False, null=True)
    TotalPrice = MoneyField(max_digits=55, decimal_places=2, default_currency='IDR')
    Colors = models.CharField(max_length=50, default="black")
    Buyers = models.ForeignKey(Dealers, on_delete=models.CASCADE,related_name='dealers_transaction_buyer', null=True)
    Owner = models.ForeignKey(settings.AUTH_USER_MODEL, limit_choices_to={'is_customer': True}, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return str(self.Vin)
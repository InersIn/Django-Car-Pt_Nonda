from django.db import models
from djmoney.models.fields import MoneyField

# Create your models here.
class Brands(models.Model):
    BrandName = models.CharField(max_length=50)
    Images = models.ImageField(upload_to="brands/%Y/%m/%d/", height_field=None, width_field=None, max_length=None, null=True)

    def __str__(self):
        return self.BrandName

class Models(models.Model):
    ModelsName = models.CharField(max_length=50)

    def __str__(self):
        return self.ModelsName

class Colors(models.Model):
    ColorsName = models.CharField(max_length=50)

    def __str__(self):
        return self.ColorsName
    
class Vehicle(models.Model):
    VehicleName = models.CharField(max_length=50)
    Price = MoneyField(max_digits=55, decimal_places=2, default_currency='IDR')
    BrandName = models.ForeignKey(Brands, on_delete=models.CASCADE, null=True, related_name="Vehicle_BrandName")
    ModelsName = models.ForeignKey(Models, on_delete=models.CASCADE)
    Images = models.ImageField(upload_to="vehicle/%Y/%m/%d/", height_field=None, width_field=None, max_length=None, null=True)
    Colors = models.ManyToManyField(Colors)

    def __str__(self):
        return self.VehicleName

class Units(models.Model):
    Vin = models.CharField(max_length=50)
    VehicleName = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    is_sell = models.BooleanField(default=False)

    def __str__(self):
        return self.Vin

class Transaction(models.Model):
    Buyers = models.ForeignKey("dealers.Dealers", on_delete=models.CASCADE,related_name="manufacture_transaction_buyer", null=True)
    Date = models.DateTimeField(auto_now=False, auto_now_add=True)
    Vin = models.ForeignKey(Units, on_delete=models.CASCADE, related_name='manufacture_vehicle_identification_number', null=True)
    TotalPrice = MoneyField(max_digits=55, decimal_places=2, default_currency='IDR')
    Colors = models.CharField(max_length=50, default="black")

    def __str__(self):
        return self.Buyers.DealerName
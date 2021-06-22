from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser

from dealers.models import Transaction, Units

# Create your models here.
class User(AbstractUser):
    is_customer = models.BooleanField(default=False, null=True)
    is_dealer = models.BooleanField(default=False, null=True)
    is_supplier = models.BooleanField(default=False, null=True)
    is_hire = models.BooleanField(default=False, null=True)

class Customers(models.Model):
    CustomerName = models.CharField(max_length=45, unique=True, null=True)
    CustomerAddress = models.CharField(max_length=45, unique=True, null=True)
    CustomerGender = models.CharField(max_length=45, unique=True, null=True)
    CustomerPhone = models.CharField(max_length=45, unique=True, null=True)
    CustomerAnnualIncome = models.CharField(max_length=45, unique=True, null=True)
    
    class Meta:
        verbose_name = ("Customers")
        verbose_name_plural = ("Customerss")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("Customers_detail", kwargs={"pk": self.pk})

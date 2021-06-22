from django.urls import path

from .views import dealers, my, vehicle, brands, buyVehicle, input, report

urlpatterns = [
    path("<str:dealerName>", dealers),
    path("<str:dealerName>/models", dealers),
    path("me/", my),
    path("me/vehicle/", vehicle),
    path("me/brands/", brands),
    path("me/buy/<int:id>", buyVehicle),
    path("me/report/", report),
    
    path("input/<int:n>", input), # For automatically input random data to manufactures.Unit
]
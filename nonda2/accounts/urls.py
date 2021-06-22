from django.urls import path
from .views import index, register, login, logout, pesanan, cart, ListPesanan

urlpatterns = [
    path('', index),
    path('register/', register),
    path('login/', login),
    path('logout/', logout),
    path('me/cart/', cart),
    path('me/pesanan/', ListPesanan),
    path('me/pesanan/<int:id>', pesanan)
]

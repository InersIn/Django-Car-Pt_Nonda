from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.sessions.backends.db import SessionStore
import json

from .forms import VehicleBuyForm
from django.utils import timezone

from .models import Dealers, Transaction as DTransaction, Units as DealerUnits
from accounts.models import User
from manufactures.models import Brands, Vehicle, Models, Units, Transaction

# Create your views here.
def dealers(request, dealerName):
    data = Dealers.objects.get(DealerSlug=dealerName)
    return render(request, 'dealers-zoom.html', {'data': data})

def getOffice(user):
    office = ""
    try:
        office = Dealers.objects.get(DealerAdmin=user.id)
    except:
        pass
    return office

def getVIN():
    import requests, re
    url = "https://vingenerator.org/"

    vin=""

    while vin == "":
        res = requests.get(url).text
        match = re.search(r"value=\"([\w]+)\"", res)
        if match:
            vin = match.group(1)
    return vin

@login_required(login_url="/login")
def my(request):
    user = request.user
    return render(request, 'dealers-index.html', {'dealer': getOffice(user)})

@login_required(login_url="/login")
def vehicle(request):
    user = request.user
    office = getOffice(user)

    dunits = DealerUnits.objects.filter(Owner=office)
    data = []
    for unit in dunits:
        manUnits = Units.objects.get(Vin=unit.Vin)
        dvehicle = Vehicle.objects.get(VehicleName=manUnits.VehicleName)
        data.append({str(dvehicle.ModelsName): {unit: dvehicle}})

    units = {}
    models = list(set([list(models)[0] for models in data]))
    # for unit in data:
    for model in models:
        units[model] = []
        for unit in data:
            try:
                units[model].append(unit[model])
            except:
                pass
    data=units
    return render(request, 'dealers-vehicles.html', {'dealer': office, 'data': data})

@login_required(login_url="/login")
def brands(request):
    user = request.user

    if user.is_dealer:
        brands = [brand.id for brand in Brands.objects.all()]

        dealer = getOffice(user)

        dealerInfo = Dealers.objects.get(DealerName=dealer)
        # vehicles = list(Vehicle.objects.all())
        units = Units.objects.all()

        models = [model for model in [unit for unit in units  if str(unit.VehicleName.BrandName) == str(dealerInfo.DealerBrand) and unit.is_sell == False]]
        data = {}
        for model in models:
            data[model.VehicleName.ModelsName] = []
            for unit in models:
                vehicle = Vehicle.objects.get(id=unit.VehicleName.id)
                if str(vehicle.ModelsName) == str(model.VehicleName.ModelsName):
                    data[model.VehicleName.ModelsName].append(vehicle)
            data[model.VehicleName.ModelsName] = list(set(data[model.VehicleName.ModelsName]))
        return render(request, 'dealers-models.html', {'dealer': dealer, 'vehicles': data, 'models': models})
    return render(request, 'dealers-models.html')

@login_required(login_url="/login")
def buyVehicle(request, id):
    request.session['product-key']=id
    user = request.user
    office = getOffice(user)

    vehicleName = Vehicle.objects.get(id=id)
    units = [unit for unit in Units.objects.all() if str(unit.VehicleName) == str(vehicleName.VehicleName) and unit.is_sell == False][0]
    info = Vehicle.objects.get(VehicleName=units.VehicleName)
    unit = Units.objects.get(id=units.id)

    import time
    if request.method == "POST":
        dtransaction = DTransaction()
        dtransaction.is_buy = True
        dtransaction.Vin = unit
        dtransaction.DateBuy = timezone.now().replace(month=1)
        dtransaction.TotalPrice = info.Price
        dtransaction.Colors = request.POST['Colors']
        dtransaction.Buyers = office
        dtransaction.save()

        dunits = DealerUnits()
        dunits.Vin = unit
        dunits.Colors = request.POST['Colors']
        dunits.Owner = office
        dunits.save()

        transaction = Transaction()
        transaction.Buyers=office
        transaction.TotalPrice=info.Price
        transaction.Vin = unit
        transaction.Date=time.time()
        transaction.Colors=request.POST['Colors']
        transaction.save()

        unit.is_sell=True
        unit.save()

        return redirect(brands)
        
    else:
        # form = VehicleBuyForm()
        data = {'units': units, 'info': info, 'colors': info.Colors.all()}
        return render(request, 'dealers-buyVehicle.html', {'data': data, 'dealer':getOffice(user)})

def report(request):
    user = request.user
    office = getOffice(user)
    rtransaction = Transaction.objects.all().filter(Buyers=office)

    from pprint import pprint

    runits = DealerUnits.objects.all().filter(is_sell=True)
    units = list(set([unit.Vin.VehicleName for unit in runits]))
    
    alls = [str(unit.Vin.VehicleName) for unit in rtransaction]
    data = {}
    for unit in units:
        data[unit.VehicleName] = {}
        for vin in runits:
            if str(unit.VehicleName) == str(vin.Vin.VehicleName):
                data[unit.VehicleName]['data']=vin.Vin.VehicleName
                data[unit.VehicleName]['sold']=alls.count(str(vin.Vin.VehicleName))
                # data[unit.VehicleName]['total']=
    print("Total:",len(alls))
    pprint(data)

    return render(request, 'dealers-report.html')

def input(request, n):
    import random
    vin = [getVIN() for _ in range(n)]
    unit = Vehicle.objects.all()
    for x in range(n):
        car = random.choices(unit)[0]
        obj = Units()
        obj.Vin = vin[x]
        obj.VehicleName = car
        obj.save()
    return HttpResponse(f'Success input {n} data!')


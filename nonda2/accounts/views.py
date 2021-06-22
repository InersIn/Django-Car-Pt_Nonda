from django.shortcuts import render, redirect
from django.contrib.auth import login as loggin, logout as loggout, authenticate
from .forms import SignUpForm, LoginForm

from django.utils import timezone

from django.conf import settings
from .models import User
from dealers.models import Units as DealerUnits, Dealers, Transaction
from manufactures.models import Vehicle, Units as ManufacturesUnits
from django.contrib.auth.decorators import login_required

# Create your views here.
def index(request):
    from pprint import pprint
    units = DealerUnits.objects.all()
    return render(request, 'accounts-dashboard.html', {'data': units})

@login_required(login_url="/login")
def cart(request):
    return redirect(index)

@login_required(login_url="/login")
def ListPesanan(request):
    dealers = Dealers.objects.all()
    data = {}
    from pprint import pprint
    units = Transaction.objects.all().filter(Owner=request.user)
    dealers = list(set([dealer.Buyers for dealer in units]))
    data = {}

    for dealer in dealers:
        data[dealer] = []
        for unit in units:
            if str(unit.Buyers) == str(dealer):
                data[dealer].append(unit)
    pprint(data)

@login_required(login_url="/login")
def pesanan(request, id):
    units = DealerUnits.objects.get(Vin=id)
    info = ManufacturesUnits.objects.get(Vin=units)
    if units.is_sell == False:
        if request.method == "POST":

            units.is_sell = True
            units.Buyers = User.objects.get(id=request.user.id)
            units.save()

            dtransaction = Transaction.objects.get(Vin=info)
            dtransaction.is_sell = True
            # dtransaction.DateSell = timezone.now().replace(month=3)
            dtransaction.DateSell = timezone.now()
            dtransaction.Owner = User.objects.get(id=request.user.id)
            dtransaction.Vin = units.Vin
            dtransaction.save()

            return redirect(index)
        else:
            user = User.objects.get(username=request.user)
            data = {'units': units, 'info': info}
            return render(request, 'accounts-pesanan.html',{'data': data})
    else:
        return redirect(index)

def register(request):
    if request.user.is_authenticated:
        return redirect(index)
    from .models import User
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():

            account = form.save(commit=False)
            account.user = request.user
            account.save()

            user = User.objects.get(username=account.username)
            if int(request.POST.get('roles')) == 1:
                user.is_customer = True
            elif int(request.POST.get('roles')) == 2:
                user.is_dealer = True
            elif int(request.POST.get('roles')) == 3:
                user.is_supplier = True
            else:
                user.is_customer = True
                user.is_dealer = False
                user.is_supplier = False
            user.save()
            return redirect(request.path)
    else:
        form = SignUpForm()
    return render(request, 'register.html', {'form': form})

def login(request):
    if request.user.is_authenticated:
        return redirect(index)
    next = '/'
    try:
        next = request.GET.get('next')
    except:
        next = '/'
    if request.method == "POST":
        from .models import User
        username = request.POST['username']
        password = request.POST['password1']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                if not user.is_hire:
                    from dealers.models import Dealers
                    try:
                        admin = Dealers.objects.get(DealerAdmin=user.id)
                        user.is_hire = True
                        user.save()
                    except:
                        pass
                loggin(request, user)
                return redirect(request.GET['next'])
    
    form = LoginForm()
    return render(request, 'login.html', {'form': form})

def logout(request):
    loggout(request)
    return redirect('/')
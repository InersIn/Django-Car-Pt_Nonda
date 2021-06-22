from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm

from .models import User

class SignUpForm(UserCreationForm):
    choices = [('1', 'Customer'),
               ('2', 'Admin Dealer'),
               ('3', 'Supplier')]
    roles = forms.CharField(label="Select your role" ,widget=forms.Select(choices=choices))

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2', 'roles']

class LoginForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'password1']

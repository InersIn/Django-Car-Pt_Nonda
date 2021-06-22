from django import forms

from manufactures.models import Transaction

class VehicleBuyForm(forms.ModelForm):
    def __init__(self, **kwargs):
        super(VehicleBuyForm, self).__init__(kwargs)
    class Meta:
        model = Transaction
        fields = "__all__"
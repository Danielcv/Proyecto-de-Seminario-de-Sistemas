from django import forms
from django.forms import ModelForm
from models import Registro
class RegistroForm(ModelForm):
	password=forms.CharField(widget=forms.PasswordInput)
	repassword=forms.CharField(widget=forms.PasswordInput)
	class Meta:
		model=Registro
		fields=["nombre","email"]
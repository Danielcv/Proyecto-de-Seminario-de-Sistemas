from django import forms
from django.forms import ModelForm
from models import Registro
class RegistroForm(ModelForm):
	password=forms.CharField(widget=forms.PasswordInput)
	repassword=forms.CharField(widget=forms.PasswordInput)
	class Meta:
		model=Registro
		fields=["nombre","email"]

	def clean_nombre(self):
		diccionario_limpio = self.cleaned_data
		nombre = diccionario_limpio.get('nombre')
		if len(nombre) <= 5:
			raise forms.ValidationError("El nombre deve de contener mas de 4 caracteres")
		return nombre		
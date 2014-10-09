from django.shortcuts import render, render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from models import Registro
from forms import RegistroForm
import datetime
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.contrib.auth import login, logout, authenticate
# Create your views here.
def login_usuario(request):
	if request.method=="POST":
		form=RegistroForm(request.POST)
		if form.is_valid():
			p=Registro(
				nombre=form.cleaned_data["nombre"],
				email=form.cleaned_data["email"],
				password=form.cleaned_data["password"],
				fecha=datetime.datetime.now().date(),
				hora=datetime.datetime.now().time()
				)
			p.save()
			return HttpResponseRedirect("/registro/usuario_registrado/")
	else:
		form=RegistroForm()
	return render_to_response("login.html",{"miregistro":form},RequestContext(request))

def usuario_registrado(request):
	return render_to_response("usuario_registrado.html",{},RequestContext(request))


def registro_login(request):
	if  request.method=="POST":
		form=AuthenticationForm(request.POST)
		if(form.is_valid()==False):
			username=request.POST["username"]
			password=request.POST["password"]
			resultado=authenticate(username=username,password=password)
			if resultado:
				login(request,resultado)
				request.session["name"]=username
				return HttpResponseRedirect("/perfil/")
	form=AuthenticationForm()
	return render_to_response("index.html",{"form":form},RequestContext(request))
def perfil(request):
	return render_to_response("perfil.html",{"nombre":request.session["name"]},RequestContext(request))
#def HolaMundo(request):
#	return render_to_response("index.html",{"fecha":datetime.datetime.today()})
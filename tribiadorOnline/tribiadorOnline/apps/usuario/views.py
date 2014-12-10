from django.shortcuts import render, render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from .forms import *
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate,logout
# from django.contrib.session.backends.db import SessionStore

# Create your views here.
def registro_usuario(request):
	if request.method=="POST":
		formulario_registro=fusuario(request.POST)
		if formulario_registro.is_valid():
			nuevo_usuario=request.POST['username']
			formulario_registro.save()
			usuario=User.objects.get(username=nuevo_usuario)
			usuario.is_active=False
			usuario.save()
			perfil=Perfil.objects.create(user=usuario)
			return HttpResponseRedirect("/")
	else:
		formulario_registro=fusuario()
	return render_to_response("usuario/registro_user.html",{'formulario':formulario_registro},context_instance=RequestContext(request))


def login_usuario(request):
	if request.method=="POST":
		formulario=AuthenticationForm(request.POST)
		if request.session['cont']>3:
			formulario2=fcapcha(request.POST)
			if formulario2.is_valid():
				pass
			else:
				datos={'formulario':formulario,'formulario2':formulario2}
				return render_to_response("usuario/login.html",datos,context_instance=RequestContext(request))		
		if formulario.is_valid:
			usuario=request.POST['username']
			contrasena=request.POST['password']
			acceso=authenticate(username=usuario,password=contrasena)
			if acceso is not None:
				if acceso.is_active:
					if acceso.is_superuser:
						return HttpResponseRedirect("/registro/tema/")
					else:
						login(request, acceso)
						del request.session['cont']
						return HttpResponseRedirect("/user/perfil/")
				else:
					login(request, acceso)
					# p=SessionStore()
					# p["name"]=username
					# p["estado"]="conectado"
					# p.save()
					#request.session["idkey"]=p.session_key
					request.session["name"]=username
					return HttpResponseRedirect("/user/active/")
			else:
				request.session['cont']=request.session['cont']+1
				aux=request.session['cont']
				estado=True
				mensaje="Error en los datos "+str(aux)
				if aux>3:
					formulario2=fcapcha()
					datos={'formulario':formulario,'formulario2':formulario2,'estado':estado,'mensaje':mensaje}
				else:
					datos={"formulario":formulario,'estado':estado,'mensaje':mensaje}
				return render_to_response("usuario/login.html",datos,context_instance=RequestContext(request))		
	else:
		request.session['cont']=0
		formulario=AuthenticationForm()
	return render_to_response("usuario/login.html",{'formulario':formulario},context_instance=RequestContext(request))


def logout_view(request):
	logout(request)
	return HttpResponseRedirect("/")

def perfil_view(request):
	return render_to_response("usuario/perfil.html",{},context_instance=RequestContext(request))

def user_active_view(request):
	if request.user.is_authenticated():
		usuario=request.user
		if usuario.is_active:
			return HttpResponseRedirect("/user/perfil/")
		else:
			if request.method=="POST":
				u=User.objects.get(username=usuario)
				perfil=Perfil.objects.get(user=u)
				formulario=fperfil(request.POST,request.FILES,instance=perfil)
				if formulario.is_valid():
					formulario.save()
					u.is_active=True
					u.save()
					return HttpResponseRedirect("/user/perfil/")
			else:
				formulario=fperfil()
			return render_to_response("usuario/activar.html",{'formulario':formulario},context_instance=RequestContext(request))
	else:
		return HttpResponseRedirect("/login/")

def editar_datos(request):	
	perfil=Perfil.objects.get(user=request.user)
	if request.method=="POST":
		formulario=fperfil(request.POST,request.FILES,instance=perfil)
		if formulario.is_valid():
			formulario.save()
			return HttpResponseRedirect("/user/perfil/")
	else:
		formulario=fperfil(instance=perfil)
	return render_to_response("usuario/registro_user.html",{"formulario":formulario},RequestContext(request))


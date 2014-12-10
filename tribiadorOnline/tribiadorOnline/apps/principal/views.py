from django.shortcuts import render, render_to_response
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from .forms import *
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate,logout

# Create your views here.
def inicio_view(request):
	# menu=permisos(request)
	usuarios=User.objects.all()
	return render_to_response("principal/inicio.html",{},context_instance=RequestContext(request))

def registro_tema(request):
	# menu=permisos(request)
	usuario=request.user
	# if(not usuario.has_perm("usuarios.add.tema")):
	#  	return HttpResponseRedirect("/error/permit");
	titulo="Regitro de temas"
	temas=Tema.objects.all()
	if request.method=="POST":
		formulario=ftema(request.POST)
		if formulario.is_valid():
			formulario.save()
			estado=True
			datos={'titulo':titulo,'formulario':formulario,'estado':estado,'temas':temas,'usuario':usuario}
			return render_to_response("principal/registro_temas.html",datos,context_instance=RequestContext(request))
	else:
		formulario=ftema()
	datos={'titulo':titulo,'formulario':formulario,'temas':temas,'usuario':usuario}
	return render_to_response("principal/registro_temas.html",datos,context_instance=RequestContext(request))

def agregar_preguntas(request,id):
	# menu=permisos(request)
	tema=Tema.objects.get(id=int(id))
	titulo="Registrar pregunta para el tema de "+tema.nombre
	titulo2="Registre las respuestas"
	if request.method=="POST":
		formulario=fpregunta(request.POST)
		formulario2=frespuesta(request.POST)
		if formulario.is_valid() and formulario2.is_valid():
			pregunta=formulario.save(commit=False)
			pregunta.tema=tema
			pregunta.save()
			respuesta=formulario2.save(commit=False)
			respuesta.pregunta=pregunta
			respuesta.save()
			estado=True
			formulario=fpregunta()
			datos={'titulo':titulo,'formulario':formulario,'estado':estado,'titulo2':titulo2,'formulario2':formulario2}
			return render_to_response("principal/registro_preguntas.html",datos,context_instance=RequestContext(request))
	else:
		formulario=fpregunta()
		formulario2=frespuesta()
	datos={'titulo':titulo,'titulo2':titulo2,'formulario':formulario,'formulario2':formulario2}
	return render_to_response("principal/registro_preguntas.html",datos,context_instance=RequestContext(request))

def editar_preguntas(request,id):
	# menu=permisos(request)
	pregunta=Pregunta.objects.get(id=int(id))
	respuesta=Respuesta.objects.get(pregunta=pregunta)
	titulo="Editar pregunta"
	titulo2="Editar las respuestas"
	if request.method=="POST":
		formulario=fpregunta(request.POST,instance=pregunta)
		formulario2=frespuesta(request.POST,instance=respuesta)
		if formulario.is_valid() and formulario2.is_valid():
			formulario.save()
			formulario2.save()
			estado=True
			datos={'titulo':titulo,'formulario':formulario,'estado':estado,'titulo2':titulo2,'formulario2':formulario2}
			return render_to_response("principal/registro_preguntas.html",datos,context_instance=RequestContext(request))
	else:
		formulario=fpregunta(instance=pregunta)
		formulario2=frespuesta(instance=respuesta)
	datos={'titulo':titulo,'titulo2':titulo2,'formulario':formulario,'formulario2':formulario2}
	return render_to_response("principal/registro_preguntas.html",datos,context_instance=RequestContext(request))


def ver_preguntas(request,id):
	tema=Tema.objects.get(id=int(id))
	preguntas=Pregunta.objects.filter(tema=tema)
	datos={'tema':tema,'preguntas':preguntas}
	return render_to_response("principal/ver_preguntas.html",datos,context_instance=RequestContext(request))


# def elininar_tema(request,id):
# 	tema=pregunta.objects.get(id=int(id))
# 	id=tema.pregunta(respuesta.id)
# 	pregunta=



def eliminar_pregunta(request,id):
	pregunta=Pregunta.objects.get(id=int(id))
	id=pregunta.tema.id
	respuesta=Respuesta.objects.get(pregunta=pregunta)
	respuesta.delete()
	pregunta.delete()
	return HttpResponseRedirect("/tema/edit/"+str(id)+"/")








#  def login_admin(request):
# 	menu=permisos(request)
# 	if request.method=="POST":
# 		formulario=AuthenticationForm(request.POST)
# 		if(formulario.is_valid()==False):
# 			username=request.POST["username"]
# 			password=request.POST["password"]
# 			resultado=authenticate(username=username,password=password)
# 			if resultado:
# 				login(request,resultado)
# 				request.session["name"]=username
# 				return HttpResponseRedirect("/admin/registro_temas/")
# 	formulario=AuthenticationForm()
# 	return render_to_response("principal/admin.html",{"formulario":formulario},context_instance=RequestContext(request))

# def permisos(request):
# 	listadepermisos=[]
# 	if request.user.has_perm("usuario.add_tema"):
# 		listadepermisos.append({"url":"/registro/tema/","label":"temas"})
# 	return listadepermisos

from django.conf.urls import patterns, include, url
from .views import *
urlpatterns = patterns('',
    url(r'^$',inicio_view, name='Inicio'),
    url(r'^registro/tema/$',registro_tema, name='Tema'),
    url(r'^tema/add/(\d+)/$',agregar_preguntas, name='agregar_pregunta'),
    url(r'^pregunta/edit/(\d+)/$',editar_preguntas, name='editar_pregunta'),
    url(r'^tema/edit/(\d+)/$',ver_preguntas, name='edit_pregunta'),
    # url(r'^pregunta/eliminar/(\d+)/$',eliminar_pregunta, name='eliminar_pregunta'),
    #url(r'^registro/pregunta/$',registro_pregunta, name='Pregunta'),
)
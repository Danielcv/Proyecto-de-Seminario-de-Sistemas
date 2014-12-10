from django.conf.urls import patterns, include, url
from .views import *

urlpatterns = patterns('',
    url(r'^user/registro/$',registro_usuario),
    url(r'^login/$',login_usuario),
    url(r'^logout/$',logout_view),
    url(r'^user/perfil/$',perfil_view),
    url(r'^user/active/$',user_active_view),
    # url(r'^user/modificar/$',modificar_perfil),
    url(r'^editar/datos/$',editar_datos),
    #url(r'^modificar/perfil/(\d+)/$',actualiza_usuario),
)

from django.conf.urls import patterns, include, url
from views import registro_login, usuario_registrado, login_usuario, perfil
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'tribiaOnline.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$',registro_login),
    url(r'^registro/usuario_registrado/$',usuario_registrado),
    url(r'^registro/$',login_usuario),
    url(r'^perfil/$',perfil),
)

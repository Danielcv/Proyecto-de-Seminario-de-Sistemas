from django.conf.urls import patterns, include, url
#from tribiaOnline.apps.usuarios.views import HolaMundo
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'tribiaOnline.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    #url(r'^$', HolaMundo),
    url(r'^', include('tribiaOnline.apps.usuarios.urls')),
)
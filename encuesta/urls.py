from django.urls import path
from . import views, views_stats

app_name ='encuesta'

urlpatterns = [
    path('', views.index, name='index'),
    path('encuesta/start', views.start, name='start'),
    path('encuesta/privacidad', views.privacy, name='privacy'),
    path('encuesta/save', views.save, name='save'),
    path('stats/preview', views_stats.salariomx, name='stats')
]

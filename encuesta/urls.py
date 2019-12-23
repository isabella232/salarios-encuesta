from django.urls import path
from . import views

app_name ='encuesta'

urlpatterns = [
    path('', views.index, name='index'),
    path('start', views.start, name='start'),
    path('privacidad', views.privacy, name='privacy'),
    path('save', views.save, name='save')
]

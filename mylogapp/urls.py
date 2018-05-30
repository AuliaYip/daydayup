from django.urls import path
from . import views

app_name = 'mylogapp'
urlpatterns = [
    path("", views.index, name='index'),
    path("topics/", views.topics, name='topics')
]
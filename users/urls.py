from django.contrib.auth.views import login
from django.urls import path

app_name = "users"

urlpatterns = [
    path("login/", login, {"template_name": "users/login.html"}, name="login")
]
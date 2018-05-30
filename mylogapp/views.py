from django.shortcuts import render
from .models import Topic
# Create your views here.


def index(request):
    return render(request, "mylogapp/index.html")


def topics(request):
    topic = Topic.objects.order_by("date_added")
    content = {"topics": topic}
    return render(request, "mylogapp/topics.html", content)

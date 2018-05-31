from django.shortcuts import render
from django.http import HttpResponseRedirect
from .forms import TopicForm
from django.urls import reverse
from .models import Topic
# Create your views here.


def index(request):
    return render(request, "mylogapp/index.html")


def topics(request):
    topic = Topic.objects.order_by("date_added")
    content = {"topics": topic}
    return render(request, "mylogapp/topics.html", content)


def topic(request, topic_id):
    topic = Topic.objects.get(id=topic_id)
    entries = topic.entry_set.order_by("-date_added")
    context = {"topic":topic, "entries":entries}
    return render(request, "mylogapp/topic.html", context)


def new_topic(request):
    if request.method != "POST":
        form = TopicForm()
    else:
        form = TopicForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse("mylogapp:topics"))

    context = {"form": form}
    return render(request, "mylogapp/new_topic.html", context)
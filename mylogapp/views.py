from django.shortcuts import render
from django.http import HttpResponseRedirect

from mylogapp.models import Topic, Entry
from .forms import TopicForm, EntryForm
from django.urls import reverse
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
    context = {"topic": topic, "entries": entries}
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


def new_entry(request, topic_id):
    topic = Topic.objects.get(id=topic_id)
    if request.method != "POST":
        form = EntryForm()
    else:
        form = EntryForm(data=request.POST)
        if form.is_valid():
            new_entry = form.save(commit=False)
            new_entry.topic = topic
            new_entry.save()
            return HttpResponseRedirect(reverse("mylogapp:topic", args=[topic_id]))
    context = {"topic": topic, "form": form}
    return render(request, "mylogapp/new_entry.html", context)


def edit_entry(request, entry_id):
    entry = Entry.objects.get(id=entry_id)
    topic = entry.topic

    if request.method != "POST":
        form = EntryForm(instance=entry)
    else:
        form = EntryForm(instance=entry, data=request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('mylogapp:topic', args=[topic.id]))

    context = {"entry": entry, "topic": topic, "form": form}
    return render(request, "mylogapp/edit_entry.html", context)


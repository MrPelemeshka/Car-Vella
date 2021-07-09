from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets
from rest_framework import permissions


def index(request):
    return HttpResponse("Hello, world. You're at the caravella_site index.")


def test(request):
    return HttpResponse("HI!!!")

from django.urls import include, path

urlpatterns = [
    path('', include('caravella_site.api.users')),
    path('', include('caravella_site.api.tickets')),
    path('', include('caravella_site.api.promocodes')),
    path('', include('caravella_site.api.car')),
    path('', include('caravella_site.api.bicycle')),

]

from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("Mosd061217./", admin.site.urls),
    path("", include("hola.urls")),
]

from django.shortcuts import render


def hola_mundo(request):
    """Vista que muestra la página de Hola Mundo."""
    return render(request, "hola/index.html")

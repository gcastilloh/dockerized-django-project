# dockerized django project

En este repo se encuentra un ejemplo de aplicación simple de django donde se dockeriza django.

Se implantan contenedores de:

* la aplicación de django `app` + gunicorn
* el servidor de base de datos postgresql
* la interfaz de administración pgadmin4
* el servidor web gunicor para publicar la aplicación 

Existen dos posibles modos:

* En desarrollo: docker-compose.yml
* En producción: docker-compose.prod.yml

[Aqui](https://github.com/gcastilloh/dockerized-django-project/blob/master/notas.md) encontrará notas que realicé durante la implantación 

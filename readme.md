# Dockerized django project
Es la base de un proyecto en django, el proyecto se llama geco pero puede fácilmente migrarse a cualquier otro.

El Docker contendrá:

-una app configurada tanto para trabajar en modo desarrollo como en modo debug
-un servidor gunicorn
-un servidor nginx
-un servidor postgres

Esta configuracion se basó en el articulo:

https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/

Pero modificado debido a que se deseaba emplear pandas, y otras apps que no son directamente instalables en Alpine, por lo que
se prefirió usar Ubuntu. El ubuntu que se emplea es una version dockerizada de Ubuntu más algunas herramientas, 
[papaoso63/ubuntu-dev](https://hub.docker.com/repository/docker/papaoso63/ubuntu-dev) (Puede consultar en el repo lo que se tiene instaldo)

# Detener 

docker-compose down -v

# Desarrollo django + postgres 

docker-compose up -d --build
docker-compose exec web python3 manage.py migrate --noinput

# migracion manual de los modelos (si en entrypoint.sh estan comentados)
$ docker-compose exec web python3 manage.py flush --no-input
$ docker-compose exec web python3 manage.py migrate

Consultar la página

http://localhost:8000/admin/login/?next=/admin/
http://localhost:8000/

y verificar que los static son servidos correctamente

# Producción django + postgres + gunicorn + nginx

docker-compose -f docker-compose.prod.yml up -d --build
docker-compose -f docker-compose.prod.yml exec web python3 manage.py migrate --noinput
docker-compose -f docker-compose.prod.yml exec web python3 manage.py collectstatic --no-input --clear

Consultar las páginas:

http://localhost:1337/.
http://localhost:1337/admin


# ejecutar un comando de manage.py en este ejemplo "startapp upload"

docker-compose exec web python3 manage.py startapp upload
docker-compose exec db psql --username=hello_django --dbname=hello_django_dev

# consultar el estado de un volumen

docker volume inspect django-project_postgres_data


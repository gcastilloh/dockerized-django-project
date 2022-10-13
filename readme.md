# Fuentes:

https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/

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

# consultyar el estdo de un volumen

docker volume inspect django-project_postgres_data


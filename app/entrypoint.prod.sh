#!/bin/bash

# si este entrypoint va a ejecutarse en ubuntu debe usarse 
#    #!/bin/bash
# en alpine se emplea
#    #!/bin/sh
# si no marcará un error confuso que dice que no encuentra el entrypoint.sh
# cuando el archivo si existe pero lo que no encuentra es el shell
#
# Tambien es necesario tener cuidad con el crlf (windows) y el lf (unix)
# en mi caso me aseguro que LF este habilitado en el editor en lugar del CRLF
# en vs abajo derecha debe decir UTF-8 LF


if [ "$DATABASE" = "postgres" ]
then

    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

python3 manage.py flush --no-input
python3 manage.py migrate
python3 manage.py collectstatic  --no-input --clear

exec "$@"
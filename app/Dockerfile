# docker build -t papaoso63/dockerized-django:latest .

# pull ubuntu-dev base image

FROM papaoso63/ubuntu-dev:latest

# install netct to use command  nc in entrypoint.sh
RUN apt-get install netcat -y

# set work directory
WORKDIR /usr/src/app

# PYTHONDONTWRITEBYTECODE: Prevents Python from writing pyc files to disc (equivalent to python -B option)
# PYTHONUNBUFFERED: Prevents Python from buffering stdout and stderr (equivalent to python -u option)
# Finally, we updated Pip, copied over the requirements.txt file, installed the dependencies, and copied over the Django project itself.

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# set work directory
WORKDIR /usr/src/app

# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

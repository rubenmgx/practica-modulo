# Crear Repositorio GIT
#   Descripcion ; Funcionamiento; Requisitos para funcionamiento; Instrucciones para ejecutarla en local; Como desplegar en kubernetes

*Revisar: https://flask-mysqldb.readthedocs.io/en/latest/
Problemas con instalacion? -> https://es.stackoverflow.com/questions/321791/no-puedo-instalar-flask-mysqldb

Revisar: https://github.com/alexferl/flask-mysqldb

#
# Dockerfile
#   Crear Dockerfile que compile los requisitos a instalar
#   Dependencias

FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run"]

#   Que pruebe la aplicacion (healtcheck?)

RUN apt-get update && apt-get install -y curl
HEALTHCHECK --interval=3s --timeout=1s \
CMD curl -f http://localhost || exit 1

#   Que use Multistage

NEED TO LOOK INTO THIS

# Docker Compose
# Que permita ejecutar el .yaml en local


version: '3'
services:
web:
build: .
ports:
- "5000:5000"
redis:
image: "redis:alpine"
  environment:
    PRODUCTION: 'true'

*check: https://github.com/dockersamples/example-voting-app/blob/master/docker-compose.yml
        https://devtidbits.com/2019/11/02/customise-wordpress-on-docker/


# Logs
# Foarmato JSON con estructura LogEntry de Google
# Deben imprimirse por salida estandar de logs y salida de errores: stdout & stderr

curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh
sudo systemctl reload google-fluentd

docker run -ti --rm --log-driver=gcplogs --log-opt gcp-project=pmoncada-001 -p 8181:80 nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Configuracion
#   La aplicacion debe de ser configurable, crear fichero VAR para los datos de configuracion (ejemplo, ddbb)

NEED TO LOOK INTO THIS

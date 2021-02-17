Revisar: https://flask-mysqldb.readthedocs.io/en/latest/
Problemas con instalacion? -> https://es.stackoverflow.com/questions/321791/no-puedo-instalar-flask-mysqldb
Revisar: https://github.com/alexferl/flask-mysqldb
Docker Compose: https://github.com/dockersamples/example-voting-app/blob/master/docker-compose.yml
               https://devtidbits.com/2019/11/02/customise-wordpress-on-docker/

# Crear Repositorio GIT
#   Descripcion ; Funcionamiento; Requisitos para funcionamiento; Instrucciones para ejecutarla en local; Como desplegar en kubernetes

#
# Dockerfile
#   Crear Dockerfile que compile los requisitos a instalar -> Done
#   Dependencias -> Done
#   Que pruebe la aplicacion, healtcheck) -> Done
#   Que use Multistage -> No aplicable


# Docker Compose
# Que permita ejecutar el .yaml en local
# Logs
# Formato JSON con estructura LogEntry de Google
# Deben imprimirse por salida estandar de logs y salida de errores: stdout & stderr
# La aplicacion debe de ser configurable, crear fichero VAR para los datos de configuracion (ejemplo, ddbb)

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



curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
sudo bash install-logging-agent.sh
sudo systemctl reload google-fluentd

docker run -ti --rm --log-driver=gcplogs --log-opt gcp-project=pmoncada-001 -p 8181:80 nginx


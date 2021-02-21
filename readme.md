Poyecto final modulo:

Como obtener este repositorio: git clone https://github.com/rubenmgx/practica-modulo

# Primera Parte:

Usaremos una imagen creada y alojada en nuestro Registry de Google. 
En el caso que no tener esta imagen creada, podemos crear una nosotros mimsmos mediante el siguiente comando:

```
docker build -t <name> .
```

Con los siguientes comandos podremos correr la imagen, teniendo en cuenta que tendremos que tener una network creada donde conectar los dos contenedores:

```
docker network create <network_name>
docker run -p 5000:5000 --name <docker_name> --network <network_name> <image_name>
docker run -d --name <docker_name> --network <network_name> <image_redis<>
```

A tener en cuenta que la aplicacion Flask dispone de un healtcheck el cual actua cada 5 segundos para decirnos si la app esta healthy.
Tambien decir que la salida de logs stdout y stderr estan redireccionados. Los podras ver en el archivo Dockerfile.

Si queremos ejecutar el comando mediante docker compose, tendremos que hacer lo siguiente:

```
docker-compose up
docker-compose down
```

# Segunda Parte (k8s)

Deberemos crear un secret, mediante el siguiente comando:

```
kubectl -n practica create secret generic redis --from-literal=password=password 
```

Para Crear el nginx ingress controller:

```
~$ kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
~$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.44.0/deploy/static/provider/cloud/deploy.yaml
```

Para aplicar todo esto, deberemos hacer el siguiente comando:

```
kubectl apply -f <origen de los archivos>
```

# Tercera Parte (helm)

Para esta parte, deberemos primero instalar helm. Para ello deberemos descargarnoslo a nuestra maquina y añadirlo a las variables de entorno.

Tambien deberemos ejecutar el siguiente comando para actualizar las dependencias:

```
helm dependency update
```

Para inicializar, usaremos el siguiente comando:

```
helm install -n flask <release_name> <origen de los archivos>
```

# ISTIO

Para los que usen Windows, deberan bajarse Istio y agregarlo a las variables de entorno.

Deberemos añadir tambien el siguiente comando:

```
kubectl label ns istio istio-injection=enabled 
```

Para correr la app, pondremos el siguiente comando:

```
kubectl apply -f <origen de los archivos>
```


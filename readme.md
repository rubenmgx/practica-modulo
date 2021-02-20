docker build -t <name> .
docker network create <network_name>
docker run -p 5000:5000 --name <docker_name> --network <network_name> <image_name>
docker run -d --name <docker_name> --network <network_name> <image_redis<>

docker-compose up
docker-compose down

kubectl apply -f k8s
kubectl -n flask apply -f k8s (añadiendo el namespace con comando)
imagen GCP: eu.gcr.io/hopeful-folder-272211/practica/flask-k8s
kubectl -n flask get svc
hostname: rubenmgx-5.59.117.26.nip.io
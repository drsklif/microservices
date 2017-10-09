# Microservices
Docker and GCE tasks

## Docker host initialization
```
docker-machine create --driver google \
--google-project {your project id} \
--google-zone europe-west1-b \
--google-machine-type f1-micro \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
docker-host
```

*docker run commands diff:*
1. docker run --rm -ti tehbilly/htop
2. docker run --rm --pid host -ti tehbilly/htop
**In first case we can see only one process from docker instance. In second case we see processes from host system (because used host system namespace)**

## Useful docker commands:
1. ```docker build -t reddit:latest .``` Build image with tag reddit:latest
2. ```docker run --name reddit -d --network=host reddit:latest``` Start instance in detached mode using docker host network stack
3. ```docker login``` Docker hub authentication
4. ```docker push``` Push image to docker hub repository

## Useful docker-machine commands:
1. ```eval $(docker-machine env docker-host)``` Set docker-machine environment
2. ```docker-machine ls``` Instances list
3. ```eval $(docker-machine env -u)``` Unset docker-machine environment
4. ```docker-machine rm 'machine-name'``` Remove remote and local instances and images

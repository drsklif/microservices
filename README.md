# Microservices
Docker and GCE tasks

## Structure:
`/monolith` - Legacy [reddit](https://github.com/Artemmkin/reddit) app monolith template for Docker
`/comment`, `/post-py`, `/ui` - templates for [reddit](https://github.com/Artemmkin/reddit) app splitted to microservices
`/scripts` - examples of initializing dockerized infrastructure

# Docker infrastructure initialization
1. Run `scripts/init-docker-host.sh` to create host for docker containers in GCE
2. Run `scripts/build-images.sh` to build all necessary app images
3. Run `scripts/run-docker-instances.sh` to create network and volume and run docker containers

## Useful docker commands:
1. `docker build -t reddit:latest .` Build image with tag reddit:latest
2. `docker run --name reddit -d --network=host reddit:latest` Start instance in detached mode using docker host network stack
3. `docker login` Docker hub authentication
4. `docker push` Push image to docker hub repository
5. `docker kill $(docker ps -q)` Stop all running containers
6. `docker network create` To create network
7. `docker volume create` To create volume

## Useful docker-machine commands:
1. `eval $(docker-machine env docker-host)` Set docker-machine environment
2. `docker-machine ls` Instances list
3. `eval $(docker-machine env -u)` Unset docker-machine environment
4. `docker-machine rm 'machine-name'` Remove remote and local instances and images

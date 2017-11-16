# Microservices
Docker and GCE tasks

## Structure:
`/monolith` - Legacy [reddit](https://github.com/Artemmkin/reddit) app monolith template for Docker

`/comment`, `/post-py`, `/ui` - Templates for [reddit](https://github.com/Artemmkin/reddit) app splitted to microservices

`/prometheus` - Prometheus monitoring app docker image

`/alertmanager` - Prometheus alertmanager app docker image

`/scripts` - Examples of initializing dockerized infrastructure

`/dashboards` - Grafana dashboards for monitoring infrastructure, services and business logic

# Docker infrastructure initialization

## Prerequisites:
1. Install [GCloud SDK](https://cloud.google.com/sdk/)
2. Configure GCloud with `gcloud init`
3. Configure GCloud authentication: `gcloud auth application-default login`
4. Install [Docker Machine](https://docs.docker.com/machine/install-machine/)
5. Install [Docker Compose](https://docs.docker.com/compose/install/) if you choose appropriate method

## Manual initialization:
1. Run `scripts/init-docker-host.sh` to create host for docker containers in GCE
2. Run `eval $(docker-machine env docker-host)` to init environment for docker-host instance
4. Run `scripts/build-images.sh` to build all necessary app images
5. Run `scripts/run-docker-instances.sh` to create network and volume and run docker containers

## Initialize with docker-compose:
1. You need an instance for hosting docker containers in GCE. Use `scripts/init-docker-host.sh <your-project-id>` to create it or manually create VM instance with name `docker-host`
2. Run `eval $(docker-machine env docker-host)` to init environment for docker-host instance
3. Create `.env` file with all required environment variables. See `.env.example` for details
4. Set `USER_NAME` environment variable  with you username
5. Run `scripts/build-compose-images.sh` to build all necessary app images
6. Run `docker-compose up -d` to build images, create and start containers
7. Profit

# Misc

## Useful docker commands:
1. `docker build -t reddit:latest .` Build image with tag reddit:latest
2. `docker run --name reddit -d --network=host reddit:latest` Start instance in detached mode using docker host network stack
3. `docker login` Docker hub authentication
4. `docker push` Push image to docker hub repository
5. `docker kill $(docker ps -q)` Stop all running containers
6. `docker volume create` To create volume
7. `docker exec` Run a command in a running container

## Docker network commands:
1. `docker network create` Create a network
2. `docker network connect` Connect a container to a network
3. `docker network disconnect`  Disconnect a container from a network
4. `docker network inspect` Display detailed information on one or more networks
5. `docker network ls` List networks
6. `docker network prune` Remove all unused networks
7. `docker network rm` Remove one or more networks

## Useful docker-machine commands:
1. `eval $(docker-machine env docker-host)` Set docker-machine environment
2. `docker-machine ls` Instances list
3. `eval $(docker-machine env -u)` Unset docker-machine environment
4. `docker-machine rm 'machine-name'` Remove remote and local instances and images
5. `docker-machine ssh` Log into or run a command on a machine with SSH.

## Useful docker-compose commands:
1. `docker-compose up` Create and start containers
2. `docker-compose ps` List containers
3. `docker-compose down` Stop and remove containers, networks, images, and volumes

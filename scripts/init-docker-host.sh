#!/usr/bin/env bash

if [ "$1" != "" ]; then
    echo "Using Project ID $1"
else
    echo "You must call this script with Project ID as argument"
    exit
fi

docker-machine create --driver google \
--google-project $1 \
--google-zone europe-west1-b \
--google-machine-type n1-standard-1 \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
--google-open-port 80/tcp \
--google-open-port 3000/tcp \
--google-open-port 8080/tcp \
--google-open-port 9090/tcp \
--google-open-port 9292/tcp \
docker-host

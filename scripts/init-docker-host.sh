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
--google-machine-type f1-micro \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
docker-host
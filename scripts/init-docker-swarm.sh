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
--google-machine-type g1-small \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
master-1

docker-machine create --driver google \
--google-project $1 \
--google-zone europe-west1-b \
--google-machine-type g1-small \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
worker-1

docker-machine create --driver google \
--google-project $1 \
--google-zone europe-west1-b \
--google-machine-type g1-small \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
worker-2

docker-machine create --driver google \
--google-project $1 \
--google-zone europe-west1-b \
--google-machine-type g1-small \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
worker-3

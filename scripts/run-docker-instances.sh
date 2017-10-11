#!/usr/bin/env bash

# creating network
docker network create reddit

# creating volume
docker volume create reddit_db

docker run -d --network=reddit \
    --network-alias=srv_db \
    -v reddit_db:/data/db \
    mongo:latest

docker run -d --network=reddit \
    --network-alias=srv_post \
    --env 'POST_DATABASE_HOST=srv_db' \
    drsklif/post:1.0

docker run -d --network=reddit \
    --network-alias=srv_comment \
    --env 'COMMENT_DATABASE_HOST=srv_db' \
    drsklif/comment:2.0

docker run -d --network=reddit \
    -p 9292:9292 \
    --network-alias=app_ui \
    --env 'POST_SERVICE_HOST=srv_post' \
    --env 'COMMENT_SERVICE_HOST=srv_comment' \
    drsklif/ui:2.0

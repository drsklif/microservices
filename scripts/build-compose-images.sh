#!/usr/bin/env bash

echo Pulling mongo image
docker pull mongo:latest

echo Pulling ruby image
docker pull ruby:2.4-alpine3.6

echo Pulling python image
docker pull python:3.6.0-alpine

echo Pulling prometheus image
docker pull prom/prometheus:latest

echo Pulling prometheus node-exporter image
docker pull prom/node-exporter:v0.15.0

echo Pulling percona-mongodb-exporter image for prometheus
docker pull forekshub/percona-mongodb-exporter

echo Building post service image
cd post-py && bash docker_build.sh

echo Building comment service image
cd ../comment && bash docker_build.sh

echo Building ui service image
cd ../ui && bash docker_build.sh

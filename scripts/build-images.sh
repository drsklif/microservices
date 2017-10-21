#!/usr/bin/env bash

docker pull mongo:latest

docker build -t drsklif/post:1.0 ./post-py

docker build -t drsklif/comment:1.0 ./comment

docker build -t drsklif/ui:1.0 ./ui

#!/usr/bin/env bash

docker pull mongo:latest

docker build -t drsklif/post:1.0 ./post-py

docker build -t drsklif/comment:2.0 ./comment

docker build -t drsklif/ui:2.0 ./ui

#!/usr/bin/env bash

# usage
# build the latest image
# ./scripts/build-docker.sh
# build the image with a specified tag
# ./scripts/build-docker.sh v0.1.0

# update git repository
# git pull --no-rebase

# update the latest images
docker pull node:latest
docker pull golang:latest

# set GOPROXY environment variable
# GOPROXY=https://goproxy.cn

# set the gofs-webui docker image name by GOFS_WEBUI_IMAGE_NAME variable
GOFS_WEBUI_IMAGE_NAME=nosrc/gofs-webui

# set the gofs-webui docker image tag by GOFS_WEBUI_IMAGE_TAG variable
GOFS_WEBUI_IMAGE_TAG=latest

# reset GOFS_WEBUI_IMAGE_TAG to the value of the first parameter provided by the user
if [ -n "$1" ]; then
  GOFS_WEBUI_IMAGE_TAG=$1
fi

# remove the existing old image
docker rmi -f $GOFS_WEBUI_IMAGE_NAME:$GOFS_WEBUI_IMAGE_TAG

# build Dockerfile
docker build --build-arg GOPROXY=$GOPROXY -t $GOFS_WEBUI_IMAGE_NAME:$GOFS_WEBUI_IMAGE_TAG .

# remove dangling images
docker image prune -f

# run a container to print the gofs-webui version
docker run -it --rm --name running-gofs-webui-version $GOFS_WEBUI_IMAGE_NAME:$GOFS_WEBUI_IMAGE_TAG gofs-webui -v

# push the image to the DockerHub
# docker push $GOFS_WEBUI_IMAGE_NAME:$GOFS_WEBUI_IMAGE_TAG

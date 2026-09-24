#!/bin/bash

set -e

CONTAINER_NAME="nginx-container"

if["$(docker ps -aq -f name=^/${CONTAINER_NAME})"]; then
  echo "Removing existing container"
  docker rm -f $CONTAINER_NAME
fi

echo "Starting nginx-container"
docker run -d --name $CONTAINER_NAME -p 80:80 nginx:latest


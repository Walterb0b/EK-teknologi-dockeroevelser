#!/bin/bash

set -e

CONTAINER_NAME="nginx-container"
#Check for running container

docker rm -f $CONTAINER_NAME 2>/dev/null || true

docker run -d --name $CONTAINER_NAME -p 80:80 nginx:latest

docker exec $CONTAINER_NAME ls -la /usr/share/nginx/html

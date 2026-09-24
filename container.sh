#!/bin/bash

set -e

CONTAINER_1="nginx-container-1"
CONTAINER_2="nginx-container-2"
#Check for running container
echo "Removing containers"
docker rm -f $CONTAINER_1 $CONTAINER_2 2>/dev/null || true

echo "Starting container ($CONTAINER_1)"
docker run -d --name $CONTAINER_1 -p 80:80 nginx:latest

echo "Contents of /usr/share/nginx/html in $CONTAINER_1"
docker exec $CONTAINER_1 ls -la /usr/share/nginx/html

echo "Checking logs of $CONTAINER_1"
docker logs $CONTAINER_1

echo "Starting container ($CONTAINER_2)"
docker run -d --name $CONTAINER_2 -p 8080:80 nginx:latest

echo "Stopping all containers"
docker stop $CONTAINER_1
docker stop $CONTAINER_2

echo "Removing containers"
docker rm $CONTAINER_1
docker rm $CONTAINER_2

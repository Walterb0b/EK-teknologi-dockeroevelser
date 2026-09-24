#!/bin/bash

CONTAINER_NAME="myapp"
PORT=8080

set -e

echo "Building docker image"
docker build -t my-custom-python .

docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "Running container"
docker run -d --name $CONTAINER_NAME -p $PORT:8000 my-custom-python

echo "Curl localhost"
sleep 2
docker exec curl http://localhost:$PORT

echo "Remove the container"
docker rm -f $CONTAINER_NAME

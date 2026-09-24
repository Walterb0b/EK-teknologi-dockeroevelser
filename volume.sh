#!/bin/bash

set -e

VOLUME_NAME="my-shared-volume"
MESSAGE="Hello from container"

docker volume rm -f $VOLUME_NAME 2>/dev/null || true
docker volume create "my-shared-volume"

echo "Container writing message"
docker run --rm -v my-shared-volume:/data python:alpine sh -c "echo '$MESSAGE' > /data/message.txt"

echo "Reading message from volume"
READ_MESSAGE=$(docker run --rm -v my-shared-volume:/data python:alpine cat /data/message.txt)

echo "Recieved message: $READ_MESSAGE"

docker volume rm -f $VOLUME_NAME

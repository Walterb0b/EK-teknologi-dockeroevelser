#!/bin/bash

set -e

echo "Building docker image"
docker build -t my-custom-python .

VOLUME_NAME="my-shared-volume"
MESSAGE="Hello from container"

docker volume rm -f $VOLUME_NAME 2>/dev/null || true
docker volume create "my-shared-volume"

echo "Container writing message"
docker run --rm -v my-shared-volume:/app/data my-custom-python sh -c "echo '$MESSAGE' > /app/data/message.txt"

echo "Reading message from volume"
READ_MESSAGE=$(docker run --rm -v my-shared-volume:/app/data my-custom-python cat /app/data/message.txt)

echo "Recieved message: $READ_MESSAGE"

READ_MESSAGE_2=$(docker run --rm -v my-shared-volume:/app/data my-custom-python cat /app/data/message.txt)

echo "Recieved message: $READ_MESSAGE_2"

docker volume rm -f $VOLUME_NAME

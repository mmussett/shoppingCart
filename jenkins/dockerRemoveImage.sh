#!/bin/sh

# On the very first invocation, this will not exist and will fail, so prevent that.
IMAGE_ID=$(docker images | grep "<none>" | awk "{print \$3}")
if [ "X$IMAGE_ID" != "X" ]
then
    docker rmi -f $IMAGE_ID
fi


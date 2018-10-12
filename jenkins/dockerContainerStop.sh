#!/bin/sh

# On the very first invocation, this will not exist and will fail, so prevent that.
CONTAINER_ID=$(docker ps -a -q -f name=shoppingcart)
if [ ! -z $CONTAINER_ID ]
then 
    docker stop $CONTAINER_ID
    docker rm -f $CONTAINER_ID
fi


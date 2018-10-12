#!/bin/sh
PUBLIC_HOSTNAME=`curl http://169.254.169.254/latest/meta-data/public-hostname`
docker run -h $PUBLIC_HOSTNAME -d --name shoppingcart -p 18080:8080 -e BW_PROFILE=default  shoppingcart:latest


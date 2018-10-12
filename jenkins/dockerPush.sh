#!/bin/sh
$(aws ecr get-login --no-include-email --region eu-west-1)
docker tag shoppingcart:latest 048063763713.dkr.ecr.eu-west-1.amazonaws.com/shoppingcart:latest
docker push 048063763713.dkr.ecr.eu-west-1.amazonaws.com/shoppingcart:latest



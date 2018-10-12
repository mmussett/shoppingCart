
DOCKER_LOGIN=`aws ecr get-login --no-include-email --region eu-west-1`

eval $DOCKER_LOGIN


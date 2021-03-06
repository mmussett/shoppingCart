#!/bin/sh

PUBLIC_HOSTNAME=`curl http://169.254.169.254/latest/meta-data/public-hostname`
#docker run -h $PUBLIC_HOSTNAME -d --name shoppingcart -p 18081:8080 --link=bwcemon -e "APP_CONFIG_PROFILE=dev" -e "BW_LOGLEVEL=ERROR" -e "BW_PROFILE=docker" -e "BW_JAVA_OPTS=-Dbw.engine.opentracing.enable=true" -e "JAEGER_SAMPLER_MANAGER_HOST_PORT=172.31.46.1:5778" -e "JAEGER_ENDPOINT=http://172.31.46.1:14268/api/traces" -e "CONSUL_SERVER_URL=http://172.31.46.1:8500" -e BW_APP_MONITORING_CONFIG='{"url":"http://172.31.46.1:18080"}' shoppingcart:latest

docker run -h $PUBLIC_HOSTNAME -d --name shoppingcart -p 18081:8080 --link=bwcemon -e "APP_CONFIG_PROFILE=dev" -e "BW_LOGLEVEL=ERROR" -e "BW_PROFILE=docker" -e "BW_JAVA_OPTS=-Dbw.engine.opentracing.enable=true" -e "JAEGER_SAMPLER_MANAGER_HOST_PORT=172.17.0.1:5778" -e "JAEGER_ENDPOINT=http://172.17.0.1:14268/api/traces" -e "CONSUL_SERVER_URL=http://172.17.0.1:8500" -e BW_APP_MONITORING_CONFIG='{"url":"http://172.17.0.1:18080"}' shoppingcart:latest


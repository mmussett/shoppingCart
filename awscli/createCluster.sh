#!/bin/sh

CLUSTER_ARN=`aws ecs describe-clusters --cluster bwce-cluster | jq '.clusters[0].clusterArn'`
echo $CLUSTER_ARN

if [ -z $CLUSTER_ARN ]
then 
aws ecs create-cluster --cluster-name bwce-cluster
fi




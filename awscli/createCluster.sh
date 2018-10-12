#!/bin/sh

CLUSTER_ARN=`aws ecs describe-clusters --cluster bwce-cluster | jq '.clusters[0].clusterArn'`

if [ -n "$CLUSTER_ARN" ]
then 
aws ecs create-cluster --cluster-name bwce-cluster
fi




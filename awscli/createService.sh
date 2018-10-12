#!/bin/sh

CLUSTER_NAME=bwce-cluster
SERVICE_NAME=ShoppingCart
TASK_NAME=ShoppingCart

TASK_REV=`aws ecs describe-task-definition --task-definition $TASK_NAME | jq '.taskDefinition.revision'`

if [ ! -n "$TASK_REV" ]
then

echo $TASK_REV
echo $RESOURCE_ID

	aws ecs create-service --cluster $CLUSTER_NAME --service-name $SERVICE_NAME --task-definition $TASK_NAME:$TASK_REV --desired-count 2 --launch-type "FARGATE" --deployment-configuration "maximumPercent=200,minimumHealthyPercent=50"  --network-configuration "awsvpcConfiguration={subnets=[subnet-a55894ed],securityGroups=[sg-9f44cae5],assignPublicIp=ENABLED}"
	aws application-autoscaling register-scalable-target --resource-id service/bwce-cluster/ShoppingCart --service-namespace ecs --scalable-dimension ecs:service:DesiredCount --min-capacity 2 --max-capacity 20 --role-arn arn:aws:iam::048063763713:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling
	aws application-autoscaling put-scaling-policy --cli-input-json file://./awscli/put-scaling-policy-customer.json

fi




#!/bin/sh


TASK_REV=`aws ecs describe-task-definition --task-definition ShoppingCart | jq '.taskDefinition.revision'`

if [ -n "$TASK_REV" ]
then

	aws ecs create-service --cluster bwce-cluster --service-name ShoppingCart --task-definition ShoppingCart:$TASK_REV --desired-count 1 --launch-type "FARGATE" --deployment-configuration "maximumPercent=200,minimumHealthyPercent=50"  --network-configuration "awsvpcConfiguration={subnets=[subnet-a55894ed],securityGroups=[sg-9f44cae5],assignPublicIp=ENABLED}"
	aws application-autoscaling register-scalable-target --resource-id service/bwce-cluster/ShoppingCart --service-namespace ecs --scalable-dimension ecs:service:DesiredCount --min-capacity 1 --max-capacity 1 --role-arn arn:aws:iam::048063763713:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling
	aws application-autoscaling put-scaling-policy --cli-input-json file://./awscli/put-scaling-policy-customer.json
else
	exit -1
fi




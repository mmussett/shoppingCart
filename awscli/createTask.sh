#!/bin/sh

TASK_DEFINITION_ARN=`aws ecs list-task-definitions --family-prefix ShoppingCart | jq '.taskDefinitionArns[0]'`

if [ -n "$TASK_DEFINITION_ARN" ]
then 

  aws ecs register-task-definition --cli-input-json file://./awscli/createTask.json
fi


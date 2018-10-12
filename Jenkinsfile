
pipeline
{
	agent any
    tools { 
        maven 'Maven-3.3.9'  
    }
    environment {
      PATH = "/usr/local/bin:/usr/bin:/bin:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:/usr/share/maven/bin"
      AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
      AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
	  AWS_DEFAULT_REGION    = "eu-west-1"
    }
	stages
	{
		stage ('EAR Build Stage')
		{
			steps
			{
				sh 'mvn -f tibco.bwce.ShoppingCart.parent/pom.xml clean package initialize'
			}
		}
		stage ('Docker Build Stage')
		{
			steps
			{
				sh 'docker build -t shoppingcart .'
			}
		}
		stage ('Docker Container Cleanup Stage')
		{
			steps
			{
				sh '# On the very first invocation, this will not exist and will fail, so prevent that.
CONTAINER_ID=$(docker ps -a -q -f name=shoppingcart)
if [ ! -z $CONTAINER_ID ]
then 
    docker stop $CONTAINER_ID
    docker rm -f $CONTAINER_ID
fi'
			}
		}
		stage ('Docker Login Stage')
		{
			steps
			{
				sh 'awscli/loginDockerAWS.sh'
			}
		}
	}
}

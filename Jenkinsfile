
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
		stage ('Docker Login Stage')
		{
			steps
			{
				sh 'docker stop shoppingcart'
				sh 'docker rm shoppingcart'
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

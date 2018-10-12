
pipeline
{
	agent any
    tools { 
        maven 'Maven-3.5.4'  
    }
    environment {
      PATH = "/usr/local/bin:/usr/bin:/bin:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:/usr/share/maven/bin"
      AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
      AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
	  AWS_DEFAULT_REGION    = "eu-west-1"
    }
	stages
	{
		stage ('Build Stage')
		{
			steps
			{
				sh 'mvn -f tibco.bwce.ShoppingCart.parent/pom.xml clean package initialize docker:build'
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

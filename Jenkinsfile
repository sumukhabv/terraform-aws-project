pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

   stages {
	stage('Terraform Init') {
            steps {
                sh 'terraform init'
                 }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
	
	stage('Terraform Plan') {
        environment {
                AWS_ACCESS_KEY_ID     = credentials('aws_credentials').username
                AWS_SECRET_ACCESS_KEY = credentials('aws_credentials').password
            }   
	 steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
        environment {
                AWS_ACCESS_KEY_ID     = credentials('aws_credentials').username
                AWS_SECRET_ACCESS_KEY = credentials('aws_credentials').password
            }
	  steps {
                sh 'terraform apply --auto-approve tfplan'
            }
        }
      }
    }

pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
	AWS_ACCESS_KEY_ID     = credentials('aws_credentials').username
        AWS_SECRET_ACCESS_KEY = credentials('aws_credentials').password
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
        
	 steps {
	        withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh 'terraform plan -out=tfplan'
            }
        }
     }

        stage('Terraform Apply') {
	  steps {
		withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh 'terraform apply --auto-approve tfplan'
            }
        }
      }
      }
    }

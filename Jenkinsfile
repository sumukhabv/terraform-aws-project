pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('aws_credentials')
        AWS_SECRET_ACCESS_KEY = credentials('aws_credentials')
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
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply --auto-approve tfplan'
            }
        }
      }
    }

pipeline {

    agent any

    stages {
        stage('CheckOut') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sdevops5427/roboshop-payment-v1.git'
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t payment ."
            }
        }
        stage('Tag Image') {
            steps {
                sh "docker tag cart roboshop0088.azurecr.io/payment:latest"
            }
        }
        stage('Push Image') {
            steps {
                sh "docker push roboshop0088.azurecr.io/payment"
            }
        }
    }
}

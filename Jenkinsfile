pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }
        stage('Build') {
             script {
                    if (isUnix()) {
                        sh 'gradle build'
                    } else {
                        bat 'start gradle build'
                    }
        }
        }
        stage('Test') {
            script {
                    if (isUnix()) {
                        sh 'gradle test'
                    } else {
                        bat 'start gradle test'
                    }
        }
        }
        stage('Deploy') {

            steps {
                script {
                    if (isUnix()) {
                        sh 'java -jar build/libs/hello-world-java-V1.jar'
                    } else {
                        bat 'start java -jar build/libs/hello-world-java-V1.jar'
                    }
        }
    }
}

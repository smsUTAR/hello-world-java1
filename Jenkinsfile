pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'gradle build'
                    } else {
                        shell 'start gradle build'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'gradle test'
                    } else {
                        shell 'start gradle test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'java -jar build/libs/hello-world-java-V1.jar'
                    } else {
                        shell 'start java -jar build/libs/hello-world-java-V1.jar'
                    }
                }
            }           
        }
    }
}

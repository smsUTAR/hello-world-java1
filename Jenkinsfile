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
                sh 'cd /'
                sh 'gradle build'
            }
        }
        stage('Test') {
            steps {
                sh 'cd /'
                sh 'gradle test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cd /'
                sh 'java -jar build/libs/hello-world-java-V1.jar'
            }
        }
    }
}

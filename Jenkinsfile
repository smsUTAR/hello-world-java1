pipeline {
    agent {
        docker {
            image 'gradle:7.1.1-jdk11'
            args '-v /tmp:/tmp'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'java -jar build/libs/hello-world-java-V1.jar'
            }
        }
    }
}

pipeline {
    agent any

    environment {
        IMAGE_NAME = 'hello-world-java:v1'
    }
    tools {
    jdk 'jdk21' // name of the JDK configured in Jenkins
}

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }

        stage('Build') {
            steps {
                bat 'gradlew build'
            }
        }

        stage('Test') {
            steps {
                bat 'gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Make sure Dockerfile is in the project root
                    bat "docker build -t %IMAGE_NAME% ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove previous container if it exists
                    bat 'docker rm -f hello-world-java-container || exit 0'
                    
                    // Run new container
                    bat 'docker run -d --name hello-world-java-container -p 8080:8080 %IMAGE_NAME%'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and Docker deployment successful!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}

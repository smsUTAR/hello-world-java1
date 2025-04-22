pipeline {
    agent any

    tools {
        jdk 'jdk-1.8'            // Name of Java 17 installed in Jenkins tools config
        gradle 'Gradle7.1.1'  // Name of Gradle 7.1.1 in Jenkins tools config
    }

    environment {
        IMAGE_NAME = 'hello-world-java:v1'
        CONTAINER_NAME = 'hello-world-java-container'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }

        stage('Build') {
            steps {
                bat 'gradlew clean build'
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
                    bat "docker build -t %IMAGE_NAME% ."
                }
            }
        }

        stage('Deploy with Docker') {
            steps {
                script {
                    // Stop and remove old container if running
                    bat "docker rm -f %CONTAINER_NAME% || exit 0"

                    // Run the new container
                    bat "docker run -d --name %CONTAINER_NAME% -p 8081:8080 %IMAGE_NAME%"
                }
            }
        }
    }

    post {
        success {
            echo 'Build, test, and Docker deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}

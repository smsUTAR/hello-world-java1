pipeline {
    agent any

    environment {
        GRADLE_HOME = '/opt/gradle' // adjust if needed
        DOCKER_IMAGE = 'my-java-app:latest'
    }

    tools {
        gradle 'Gradle_7.1.1' // name it like your configured Gradle in Jenkins tools
        jdk 'jdk17'           // also needs to be configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/nawaf83/hello-world-java1.git'
            }
        }

        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 8080:8080')
                }
            }
        }
    }

    post {
        always {
            junit 'build/test-results/test/*.xml'
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}

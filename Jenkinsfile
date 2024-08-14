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
                 else {
                        shell 'start gradle build'
                
            }
        }
        stage('Test') {
            steps {
                
                        shell 'start gradle test'
                  
            }
        }
        stage('Deploy') {
            steps {
                
                        shell 'start java -jar build/libs/hello-world-java-V1.jar'
                
            }           
        }
    
}
    }
}

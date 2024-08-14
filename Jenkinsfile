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
                bat '''
                echo Running Command Prompt script
                start gradle build
                '''                
            }
        }
        stage('Test') {
            steps {
                
                bat '''
                echo Running Command Prompt script
                start gradle test
                ''' 
                  
            }
        }
        stage('Deploy') {
            steps {
                

                bat '''
                echo Running Command Prompt script
                start java -jar build/libs/hello-world-java-V1.jar
                ''' 
                
            }           
        }
    
}
    }


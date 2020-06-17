pipeline{
    agent any
    
    stages{
        stage('Build'){
            steps{
                bat "mvn clean package"
                bat "docker build . -t docker_tomcat:${env.BUILD_ID}"
            }
        }
    }
}

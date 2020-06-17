pipeline{
    agent any
    
    stages{
        stage('Build'){
            steps{
                sh "mvn clean package"
                sh "docker build . -t docker_tomcat:${env.BUILD_ID}"
            }
        }
    }
}

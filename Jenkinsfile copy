pipeline {
    agent any
    
    parameters { 
         string(name: 'tomcat_dev', defaultValue: '178.79.184.237', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '176.58.110.75', description: 'Production Server')
    } 

    triggers {
         pollSCM('* * * * *') // Polling Source Control
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "scp   **/target/*.war root@${params.tomcat_dev}:/opt/tomcat/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp   **/target/*.war root@${params.tomcat_prod}:/opt/tomcat/webapps"
                    }
                }
            }
        }
    }
}
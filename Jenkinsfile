pipeline {

    agent { label 'jenkins-agent' }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                credentialsId: 'github-key',
                url: 'git@github.com:nirmalsona/Terraform-vpc-eks.git'
            }
        }

        stage('Verify') {
            steps {
                sh 'ls -altr'
            }
        }

       
    }
}

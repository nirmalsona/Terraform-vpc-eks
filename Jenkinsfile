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
                sh 'ls -a'
            }
        }

        stage ('change directory & init' ) {
            steps {
                sh '''

                cd enviroments/dev
                terraform init
                terraform validate

               '''
       }
       }

        stage ('change directory & plan and apply' ) {
            steps {
                sh '''

                cd enviroments/dev
                terraform plan -var-file=dev.tfvars
                terraform apply -var-file=dev.tfvars --auto-approve

               '''
       }
       }
    }
}

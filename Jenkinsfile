pipeline {
    agent { label 'jenkins-agent' }

    environment {
        REPO_URL = 'git@github.com:nirmalsona/Terraform-vpc-eks.git'
        CREDENTIALS_ID = 'github-key'
    }

    stages {
        stage('Clone Code') {
            steps {
                git branch: "${env.BRANCH_NAME}",
                    credentialsId: "${CREDENTIALS_ID}",
                    url: "${REPO_URL}"
            }
        }

        stage('Set Environment Mapping') {
            steps {
                script {
                    if (env.BRANCH_NAME == "develop") {
                        envFolder = "environments/dev"
                        tfVars = "dev.tfvars"
                    } else if (env.BRANCH_NAME == "stage") {
                        envFolder = "environments/stage"
                        tfVars = "stage.tfvars"
                    } else if (env.BRANCH_NAME == "main") {
                        envFolder = "environments/dev"
                        tfVars = "dev.tfvars"
                    } else {
                        error "Branch ${env.BRANCH_NAME} not mapped to environment!"
                    }
                }
            }
        }

        stage('Terraform Init & Validate') {
            steps {
                sh """
                    cd ${envFolder}
                    terraform init -backend-config="key=terraform-${env.BRANCH_NAME}.tfstate"
                    terraform validate
                """
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                    cd ${envFolder}
                    terraform plan -var-file=${tfVars} -out=tfplan
                """
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'develop'
            }
            steps {
                sh """
                    cd ${envFolder}
                    terraform apply -auto-approve tfplan
                """
            }
        }

        stage('Approval & Apply for Stage/Prod') {
            when {
                anyOf {
                    branch 'stage'
                    branch 'main'
                }
            }
            steps {
                input message: "Approve deployment to ${env.BRANCH_NAME}?"
                sh """
                    cd ${envFolder}
                    terraform apply -auto-approve tfplan
                """
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/tfplan', fingerprint: true
        }
    }
}

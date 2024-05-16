pipeline {
    agent any
    stages {
        stage("GitCheckOut") {
            steps {
                git branch: "main", credentialsId: "macOsKey", url: "https://github.com/Prajwalprakash3722/tf-jenkins-demo.git"
            }
        }
        stage("Terraform Init") {
            steps {
                dir("infra") {
                    sh "terraform init -reconfigure"
                }
            }
        }
        stage("Terraform Validate") {
            steps {
                dir("infra") {
                    sh "terraform validate"
                }
            }
        }
        stage("Terraform Apply/Destroy") {
            steps {
                dir("infra") {
                    sh "terraform ${action} -auto-approve"
                }
            }
        }
        stage("AnsiblePlayBooks") {
            when {
                expression { action != "destroy" }
            }
            steps {
                ansiblePlaybook become: true, credentialsId: "prajwal3.intern", disableHostKeyChecking: true, installation: "Ansible", inventory: "automations/ansible/dynamic_inventory/app.py", playbook: "automations/ansible/playbooks/main.yaml", vaultTmpPath: ""
            }
        }
    }
}
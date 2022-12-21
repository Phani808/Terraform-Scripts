pipeline {
    agent any
    parameters {
        choice(
            name: 'AWS_EC2_TYPE',
            choices: ['t2.micro', 't2.medium','t2.large'],
            description: ''
        )
    }
   environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
//         stage('git clone') {
//             steps {
//               git 'https://github.com/Phani808/Terraform-Scripts.git'
//             }
//         }
        
        stage('terraform init') {
            steps {
              sh "terraform init" 
            }
        }
        
        stage('terraform plan') {
            steps {
                script {
                   def  ec2type= params.AWS_EC2_TYPE
                    println ec2type
                    sh  "ls -ll"
                    sh "pwd"
                    sh "export TF_LOGS=trace"
                   // sh "terraform init && terraform plan -var 'type=${params.AWS_EC2_TYPE}' -no-color" 
                }
            }
        }
        
        stage('terraform apply') {
            steps {
              sh "terraform apply -var 'type=${params.AWS_EC2_TYPE}' -no-color --auto-approve"

            }
        }
        
//         stage('ansible playbook') {
//             steps {
//                 sh "ls -ll && pwd"
                
//               sh "ansible-playbook ansible.yml -vvvvv"
//             }
//         }
    }
}

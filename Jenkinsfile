pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = 'mydockerhub12'
        IMAGE_NAME = 'netflix-clone'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Faiz-official/netflix-clone.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_USER}/${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                    script {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker stop netflix || true && docker rm netflix || true'
                    sh "docker run -d --name netflix -p 8080:80 ${DOCKER_HUB_USER}/${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Netflix clone deployed successfully!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}


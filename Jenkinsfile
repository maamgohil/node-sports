pipeline{
    agent {
        dockerfile {
            filename 'Dockerfile'
            additionalBuildArgs '--build-arg jenkins_user_id="$(id -u)" --build-arg jenkins_group_id="$(id -g)"'
        }

    }
    options {
        buildDiscarder(logRotator (numToKeepStr:'5'))

    }
    environment{

    }
    stages{
        stage('Build'){
            steps {
                echo "build"
            }
        }
        stage('Unit Test'){
            steps{
                echo "unit test"
            }
        }
        stage('Security Scans'){
            input {

            }
            steps{
                echo "secuirty scan"    
            }
        }
        stage('Sonar Scan'){
            steps{
                    echo "sonar scan"
            }
        }
        stage('Package'){
echo "package"
        }
        stage('Deploy'){
echo "deploy"
        }
        stage('Integration Test'){
echo "integration test"
        }        
    }
    post {
        success {
            echo "success"
        }
        failure{
            echo "failure"    
        }
        cleanup{
            echo "cleanup"
        }
    }
}
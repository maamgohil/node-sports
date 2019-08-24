pipeline {
 agent {
        dockerfile {
            filename 'Dockerfile'
            args '--privileged -v /var/run/docker.scok:/var/run/docker.sock'
            additionalBuildArgs '--build-arg jenkins_user_id="$(id -u)" --build-arg jenkins_group_id="$(id -g)"'
        }
  }
  environment {
      GIT_VERSION=""
      BRANCH_NAME="${env.BRANCH_NAME}"
  }
  stages {
    stage('Build') {
        steps{
            script{
                echo sh(returnStdout: true, script: 'env')
                echo "${BRANCH_NAME}"
            }
            
        }
        
    }
    stage('Unit Test') {
      steps {
        echo "unit test"
      }
    }    
    stage('Security Scans') {
      steps {
        echo 'secuirty scan'
      }
    }
    stage('Sonar Scan') {
      steps {
        echo 'sonar scan'
      }
    }
    stage("Version"){
        steps{
            script{
                GIT_VERSION=sh(script:"mono /GitVersion/GitVersion.exe /b master /showvariable SemVer", returnStdout: true)
                echo "GITVERSION=${GIT_VERSION}"
            }
        }
    }
    stage('Package & Release') {
      steps {
        echo "Packaging for branch ${BRANCH_NAME}"        
         script{                
                sh """
                      hub release create -m "Release ${GIT_VERSION}" ${GIT_VERSION} -t "${BRANCH_NAME}"
                """
            }
      }
    }
    stage('Deploy') {
      steps {
        echo 'deploy'
      }
    }
    stage('Integration Test') {
      steps {
        echo 'integration test'
      }
    }
  }

  post {
    success {
      echo 'success'

    }

    failure {
      echo 'failure'

    }

    cleanup {
      echo 'cleanup'

    }

  }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
}

def getGitBranchName() {
    BRANCH_NAME=scm.branches[0].name
}

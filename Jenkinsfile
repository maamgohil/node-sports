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
	echo "Release ${GIT_VERSION}"
        sh 'ls -la'
        createRelease(GIT_VERSION)
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

def createRelease(version){
	echo "version is ${version}"
	def gitversion = "${version} "
	def branchName = "${BRANCH_NAME} "
	def command = "hub release create -t $branchName $gitversion -m \"Release - $gitversion\""
	echo command
	"""
		sh command
	"""	
}

pipeline {
 agent {
        dockerfile {
            filename 'Dockerfile'
            args '--privileged -v /var/run/docker.scok:/var/run/docker.sock'
            additionalBuildArgs '--build-arg jenkins_user_id="$(id -u)" --build-arg jenkins_group_id="$(id -g)"'
        }
  }
  stages {
    stage('Build') {
      steps {
        echo 'build'
      }
    }
    stage('Unit Test') {
      steps {
        echo 'unit test'
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
    stage('Package') {
      steps {
        echo 'package'
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
  environment {
    VERSION_NUM = ''
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
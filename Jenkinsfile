pipeline {
  agent {
    docker {
      image 'mcr.microsoft.com/dotnet/core/runtime:2.2'
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
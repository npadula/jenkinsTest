pipeline {
  agent any
  stages {
    stage('Fetch') {
      steps {
        git(poll: true, url: 'https://github.com/npadula/jenkinsTest', branch: 'master')
      }
    }
    stage('') {
      steps {
        powershell(returnStatus: true, returnStdout: true, script: 'Write-Output "test"')
      }
    }
  }
}
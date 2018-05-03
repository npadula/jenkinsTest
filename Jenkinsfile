pipeline {
  agent any
  stages {
    stage('Fetch') {
      steps {
        git(poll: true, url: 'https://github.com/npadula/jenkinsTest', branch: 'master', changelog: true)
      }
    }
    stage('test') {
      steps {
        powershell(script: 'Write-Output "test"', returnStdout: true)
      }
    }
  }
}
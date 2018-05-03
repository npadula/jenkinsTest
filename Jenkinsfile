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
        powershell(returnStdout: true, script: 'Write-Output "test"')
      }
    }
  }
}
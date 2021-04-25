pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "master", url: 'https://github.com/jijoungsoo/demoFlutter.git'
            }
        }
        stage('CLEAN') {
            steps {
                sh '''
                  #!/bin/sh
                  /root/development/flutter/bin/flutter clean
                  '''
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  /root/development/flutter/bin/flutter build web
                  '''
            }
        }
    }
}
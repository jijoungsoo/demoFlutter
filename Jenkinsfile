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
        stage('ENV_FILE_MV') {
            steps {
                sh '''
                  #!/bin/sh
                  /var/jenkins_home/workspace/demoFlutter/lib/env_file_dev.dart /var/jenkins_home/workspace/demoFlutter/lib/env_file.dart
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
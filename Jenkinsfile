
pipeline {
  agent any
  tools {
    maven 'M3'
  }
  environment {
    dockerHubRegistry = ''
    dockerHubRegistryCredential = ''
  }
  stages {

    stage('Checkout Application Git Branch') {
        steps {
            git credentialsId: '',
                url: 'https://github.com/gks6141/pipeci.git',
                branch: 'main'
        }
        post {
                failure {
                  echo 'Repository clone failure !'
                }
                success {
                  echo 'Repository clone success !'
                }
        }
    }

   stage('Maven Jar Build') {
        steps {

            sh 'mvn -DskipTests=true package'
        }
        post {
                failure {
                  echo 'Maven jar build failure !'
                }
                success {
                  echo 'Maven jar build success !'
                }
        }
    }

    stage('Docker Image Build') {
        steps {
            sh "cp target/ROOT.jar ./"
            sh "cp deploy/Dockerfile ./"
            sh "docker build . -t ${dockerHubRegistry}:${currentBuild.number}"
            sh "docker build . -t ${dockerHubRegistry}:latest"
        }
        post {
                failure {
                  echo 'Docker image build failure !'
                }
                success {
                  echo 'Docker image build success !'
                }
        }
    }

    // stage('Docker Image Push') {
    //     steps {
    //         withDockerRegistry([ credentialsId: dockerHubRegistryCredential, url: "" ]) {
    //                             sh "docker push ${dockerHubRegistry}:${currentBuild.number}"
    //                             sh "docker push ${dockerHubRegistry}:latest"

    //                             sleep 10 /* Wait uploading */ 
    //                         }
    //     }
    //     post {
    //             failure {
    //               echo 'Docker Image Push failure !'
    //               sh "docker rmi ${dockerHubRegistry}:${currentBuild.number}"
    //               sh "docker rmi ${dockerHubRegistry}:latest"
    //             }
    //             success {
    //               echo 'Docker image push success !'
    //               sh "docker rmi ${dockerHubRegistry}:${currentBuild.number}"
    //               sh "docker rmi ${dockerHubRegistry}:latest"
    //             }
    //     }
    // }

  }
}

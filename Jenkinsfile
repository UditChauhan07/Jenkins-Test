node {
    stage('Clone repositroy') {
        checkout scm
    }
    
    stage('Build image') {
        app =docker.build("ubuntu")
    }
    // stage('Test image') {
        
    //     app.inside {
    //         sh 'echo "Tests passed"'
    //     }
    }
    stage('Push image') {
        
           withDockerRegistry([ credentialsId: "uditchauhan07", url: "https://hub.docker.com/" ]) {
        dockerImage.push()
        }
    }
    stage('Triger ManifestUpdate') {
        echo "triggering updatemanifestjob"
        build job: 'updatemanifest', parameters:[string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
    }
}


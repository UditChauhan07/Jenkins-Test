node {
    stage('Clone repositroy') {
        checkout scm
    }
    
    stage('Build image') {
        app =docker.build("UditChauhan07/deployment")
    }
    stage('Test image') {
        
        app.inside {
            sh 'echo "Tests passed"'
        }
    }
    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${env.BUILD_NUMBER}")
        }
    }
    stage('Triger ManifestUpdate') {
        echo "triggering updatemanifestjob"
        build job: 'updatemanifest', parameters:[string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
    }
}

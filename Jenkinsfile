pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'develop', url: 'https://github.com/cuonglh95-scuti/jenkins_test.git'
            }
        }

        stage('Check sh') {
            steps {
                sh 'pwd && cd src && pwd'
                sh 'pwd'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t scuti-c/nginx -f Dockerfile-nginx  .'
                sh 'docker build -t scuti-c/app .'
            }
        }
    }
}




// node ('slave'){
//     checkout scm

//     stage('Build') {
//         checkout scm
//         sh 'pwd && cd src && /usr/local/bin/composer install'
//         docker.build("kyo88kyo/nginx", "-f Dockerfile-nginx .")
//         docker.build("kyo88kyo/blog")
//     }

//     stage('Test') {
//         docker.image('kyo88kyo/blog').inside {
//             sh 'php --version'
//             sh 'cd /var/www/blog && ./vendor/bin/phpunit --testsuite Unit'
//         }
//     }

//     stage('Deploy') {
//         sh 'cd src && /usr/local/bin/docker-compose down'
//         sh 'cd src && /usr/local/bin/docker-compose up -d'
//         sh 'sleep 10 && cd src && /usr/local/bin/docker-compose run web php artisan migrate'
//     }

//     stage ('Test Feature') {
//         sh 'cd src && /usr/local/bin/docker-compose run web ./vendor/bin/phpunit --testsuite Feature'
//     }
// }

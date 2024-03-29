# Symfony 4 in docker startkit

This template is a toolkit to start a new Symfony 4 project.

## Get rid of the Skeleton git:

    rm -Rf .git

## Build docker

    docker-compose build && docker-compose up -d
    
## Install Symfony4

    docker exec -t -u dev app_php install_sf.sh

## Init a VCS for the new project

    git init
    git add .
    git commit
    
## Start building your application

Now you have Symfony installed.  
You could enter the app_php container as a `dev` user:
    
    docker exec -it -u dev app_php bash
    
And run `composer` commands as well as `symfony` commands.

## Access your application via a browser:

Frontend: <http://localhost:8080>  
Maildev server: <http://localhost:8002>  
PMA: <http://localhost:8081>

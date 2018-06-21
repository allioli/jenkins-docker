# Jenkins in a Docker container

## Overview

Jenkins Docker image with the ability to perform docker client commands.

It performs API calls via the docker UNIX Socket from the docker host server, mounted on the container as a volume.

Based on https://github.com/wardviaene/jenkins-docker

### Why not [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins) ?

- Ability to call docker client and docker-compose commands from the jenkins container
- Pre-install jenkins plugins
- Based on debian slim latest

## Getting Started

### With plain docker client

1. Install docker
2. Build docker image 
  ```
  git clone https://github.com/allioli/jenkins-docker.git
  cd jenkins-docker
  docker build -t -f Dockerfile.jenkins allioli/jenkins .
  ```
 3. Run container based on docker image.
  ```
  docker container run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -d --name jenkins allioli/jenkins:latest
  ```
*Details*
- Specify named volume /var/jenkins_home to re-use previous jenkins installs and configuration
- You need to run this command from the docker host machine, where the UNIX socked /var/run/docker.sock is located

### With docker-compose

1. Install docker-compose
2. `cd jenkins-docker`
3. `docker-compose up`

*Details*
- The named volume /var/jenkins_home will be created as `jenkins-docker_jenkins_home`
- You need to run this command from the docker host machine, where the UNIX socked /var/run/docker.sock is located


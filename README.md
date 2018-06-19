# Jenkins in a Docker container

## Overview

Jenkins Docker image with the ability to perform docker client commands.

It performs API calls via the docker UNIX Socket from the docker host server, mounted on the container as a volume.

Based on https://github.com/wardviaene/jenkins-docker

### Why not [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins) ?

- Ability to call docker client commands from the jenkins container
- Pre-install jenkins plugins
- Based on debian slim latest

## Getting Started

1. Install docker
2. Build docker image 
  ```
  git clone https://github.com/allioli/jenkins-docker.git
  cd jenkins-docker
  docker build -t jenkins .
  ```
 3. Run container based on docker image.
  ```
  docker container run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -d --name jenkins jenkins:latest
  ```
*Details*
- Specify named volume /var/jenkins_home to re-use previous jenkins installs and configuration
- You need to run this command from the docker host machine, where the UNIX socked /var/run/docker.sock is located

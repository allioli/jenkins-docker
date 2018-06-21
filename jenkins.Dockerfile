FROM jenkins/jenkins:lts-slim

USER root 

RUN mkdir -p /tmp/download && \
curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \
rm -rf /tmp/download/docker/dockerd && \
mv /tmp/download/docker/docker* /usr/local/bin/ && \
rm -rf /tmp/download && \
groupadd -g 999 docker && \
usermod -aG users,docker jenkins

USER jenkins

RUN /usr/local/bin/install-plugins.sh \
locale \
git \
nodejs \
docker-build-publish \
job-dsl \
workflow-aggregator \
email-ext




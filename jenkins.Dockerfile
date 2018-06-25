FROM jenkins/jenkins:lts-slim

USER root 

RUN mkdir -p /tmp/download && \
curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \
rm -rf /tmp/download/docker/dockerd && \
mv /tmp/download/docker/docker* /usr/local/bin/ && \
rm -rf /tmp/download && \
groupadd -g 999 docker && \
usermod -aG users,docker jenkins

RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) \
-o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

RUN mkdir -p /home/jenkins/.gradle && \
chown 1000:1000 /home/jenkins/.gradle

USER jenkins

RUN /usr/local/bin/install-plugins.sh \
locale \
git \
nodejs \
docker-build-publish \
job-dsl \
workflow-aggregator \
email-ext \
slack \
github-branch-source



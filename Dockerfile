FROM jenkins:2.32.3
LABEL maintainer "waltervargas@linux.com"

USER jenkins

# Install Plugins
RUN /usr/local/bin/install-plugins.sh git pipeline-stage-view job-dsl workflow-aggregator

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/
COPY files/* /tmp/
COPY files/gitconfig /var/jenkins_home/.gitconfig

USER root
RUN wget -c https://master.dockerproject.org/linux/amd64/docker-17.04.0-dev -O /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

USER jenkins
RUN /usr/local/bin/install-plugins.sh docker docker-custom-build-environment blueocean maven-plugin

ENV GIT_URL https://github.com/waltervargas/gnome-jenkins.git
ENV GIT_BRANCH master
ENV DOCKER_HOST="tcp://172.17.0.1"

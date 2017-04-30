FROM jenkins:2.32.3
LABEL maintainer "waltervargas@linux.com"

USER root
RUN wget -c https://master.dockerproject.org/linux/amd64/docker-17.04.0-dev -O /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

USER jenkins

# Install Plugins
RUN /usr/local/bin/install-plugins.sh git pipeline-stage-view job-dsl workflow-aggregator blueocean maven-plugin

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/
COPY files/* /tmp/
COPY files/gitconfig /var/jenkins_home/.gitconfig

USER root
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

ENV PACKAGES flatpak flatpak-builder
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get -y -t jessie-backports install $PACKAGES && rm -rf /var/lib/apt/lists/*

RUN flatpak remote-add gnome-nightly --from https://sdk.gnome.org/gnome-nightly.flatpakrepo && flatpak install gnome-nightly org.gnome.Sdk

USER jenkins
WORKDIR /var/jenkins_home

ENV GIT_URL https://github.com/waltervargas/gnome-jenkins.git
ENV GIT_BRANCH master
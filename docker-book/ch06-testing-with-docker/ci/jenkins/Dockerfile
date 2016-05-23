# Using a base Ubuntu 14.04 and Dockerfile 1.11 
# that has the latest updates already
#
FROM datihein/docker:1.11
MAINTAINER Dave Hein "dave@example.com"

# Setting this environment variable prevents errors during package installs
# that look like:
#
# debconf: unable to initialize frontend: Dialog
# debconf: (TERM is not set, so the dialog frontend is not usable.)
# debconf: falling back to frontend: Readline
#
# As per: http://stackoverflow.com/a/35976127/1392864
#
ARG DEBIAN_FRONTEND=noninteractive

# Add Docker client
#
ENV DOCKER_CLIENT_REFRESHED_AT=2016-05-22T14:19-0500

# Add Jenkins prerequesites
#
ENV PREJENKINS_REFRESHED_AT=2016-05-22T11:32-0500
RUN apt-get install -qqy \
  ca-certificates openjdk-7-jdk git-core

# Add Jenkins CI
#
ENV JENKINS_REFRESHED_AT=2016-05-22T11:33-0500
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

# Configure Jenkins
#
ENV JENKINS_CONFIGURED_AT=2016-05-18:59-0500
COPY ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/jenkins.sh" ]

#! /bin/bash
#
# Create and populate the data container
#
# docker run --name jenkins_workspace \
#   -v /opt/jenkins/data/workspace gliderlabs/alpine:latest \
#   /bin/true

docker run -d -p 8080:8080 --name jenkins \
  --volumes-from jenkins_workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jamtur01/jenkins-dockercli

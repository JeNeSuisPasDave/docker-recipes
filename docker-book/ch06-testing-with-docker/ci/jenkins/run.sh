#! /bin/bash
#
docker run -d -p 8080:8080 --name jenkins \
  --volumes-from dv_jenkins_workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jamtur01/jenkins-dockercli

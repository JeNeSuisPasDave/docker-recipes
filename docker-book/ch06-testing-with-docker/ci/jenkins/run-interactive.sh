#! /bin/bash
#
docker run -t -i --rm -p 8080:8080 --name jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --entrypoint /bin/bash \
  jamtur01/jenkins-dockercli


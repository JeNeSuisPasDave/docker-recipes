#! /bin/bash
#
DOCKER_IP=`docker-machine ip dev-dkr`
curl -i -H 'Accept: application/json' \
  -d 'name=Foo&status=Bar' http://${DOCKER_IP}:32770/json
echo ""

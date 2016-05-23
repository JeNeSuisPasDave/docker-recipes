#! /bin/bash
#
IP_=$(docker-machine ip dev-dkr)
FMT_="{{ (index (index .NetworkSettings.Ports \"4567/tcp\") 0).HostPort }}"
PORT_=$(docker inspect --format="${FMT_}" webapp)
curl -i -H 'Accept: application/json' \
  -d 'name=Foo&status=Bar' http://$IP_:$PORT_/json
echo ""

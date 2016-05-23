#! /bin/bash
#
FMT_="{{ (index (index .NetworkSettings.Ports \"4567/tcp\") 0).HostPort }}"
PORT_=$(docker inspect --format="${FMT_}" webapp)
echo "Port: ${PORT_}"
echo $PORT_

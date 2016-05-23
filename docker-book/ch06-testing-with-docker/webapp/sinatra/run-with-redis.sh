#! /bin/bash
#
docker run -d -p 4567 --net=app --name webapp \
  -v $PWD/webapp_redis:/opt/webapp jamtur01/sinatra

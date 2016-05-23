#! /bin/bash
#
docker run -d -p 4567 --net=app --name webapp \
  -v $PWD/webapp:/opt/webapp jamtur01/sinatra

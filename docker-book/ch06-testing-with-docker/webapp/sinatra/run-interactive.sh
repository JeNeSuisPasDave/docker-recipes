#! /bin/bash
#
docker run -t -i --rm -p 4567 --net=app --name webapp \
  -v $PWD/webapp:/opt/webapp jamtur01/sinatra \
  /bin/bash

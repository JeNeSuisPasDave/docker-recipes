#! /bin/bash
#
docker run -d -p 9292:9292 \
  -v /var/lib/dockerdata/geminabox/data:/usr/src/app/data \
  datihein/geminabox:v0.13.1

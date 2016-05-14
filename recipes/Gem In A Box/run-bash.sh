#! /bin/bash
#
# start the container with an interactive shell
# (intended for debugging and troubleshooting purpose)
#
docker run -i -t --entrypoint=/bin/bash \
  --rm \
  -v /var/lib/dockerdata/geminabox/data:/usr/src/app/data \
  datihein/geminabox:v0.13.1

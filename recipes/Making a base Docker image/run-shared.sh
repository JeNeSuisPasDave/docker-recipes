#! /bin/bash
#
docker run --rm -t -i -v /var/run/docker.sock:/var/run/docker.sock \
  datihein/docker:latest /bin/bash

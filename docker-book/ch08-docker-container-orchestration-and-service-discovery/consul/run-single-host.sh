#! /bin/bash
#

# Run consul on a single host
docker run -p 8500:8500 -p 53:53/udp \
  -h node1 jamtur01/consul -server -bootstrap

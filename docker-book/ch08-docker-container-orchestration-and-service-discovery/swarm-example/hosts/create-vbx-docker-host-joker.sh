#! /bin/bash
#

# Create a new VirtualBox virtual machine that hosts docker
#
docker-machine create --driver virtualbox \
  --virtualbox-cpu-count 2 \
  --virtualbox-memory "2048" \
  --virtualbox-disk-size "10000" \
  joker

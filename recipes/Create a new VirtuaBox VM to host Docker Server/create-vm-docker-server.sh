#! /bin/bash
#
# Create a new VirtualBox virtual machine that hosts docker
# Machine name will be 'dev-dkr'
#
docker-machine create --driver virtualbox \
  --virtualbox-cpu-count 2 \
  --virtualbox-memory "4096" \
  --virtualbox-disk-size "20000" \
  dev-dkr

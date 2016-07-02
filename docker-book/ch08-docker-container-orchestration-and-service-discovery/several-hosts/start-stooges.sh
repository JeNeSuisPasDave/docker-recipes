#! /bin/bash
#

# Start the three stooges machines
#
docker-machine start curly && \
  docker-machine start larry && \
  docker-machine start moe

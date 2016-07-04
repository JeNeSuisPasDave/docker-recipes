#! /bin/bash
#

# Start dev-dkr and the three stooges machines
#
docker-machine start dev-dkr && \
  docker-machine start curly && \
  docker-machine start larry && \
  docker-machine start moe

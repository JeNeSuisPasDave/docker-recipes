#! /bin/bash
#

# Start the three stooges machines
#
docker-machine stop curly && \
  docker-machine stop larry && \
  docker-machine stop moe

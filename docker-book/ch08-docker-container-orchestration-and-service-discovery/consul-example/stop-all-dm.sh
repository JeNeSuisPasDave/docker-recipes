#! /bin/bash
#

# Stop the three stooges machines and dev-dkr
#
docker-machine stop moe && \
  docker-machine stop larry && \
  docker-machine stop curly && \
  docker-machine stop dev-dkr

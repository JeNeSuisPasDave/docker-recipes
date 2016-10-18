#! /bin/bash
#

# Start the smoker and joker machines
#
docker-machine start joker && \
  docker-machine start smoker

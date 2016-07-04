#! /bin/bash
#

# Start the three stooges machines
#
docker-machine start curly && \
  docker-machine start larry && \
  docker-machine start moe

docker-machine scp config-consul-cluster-larry.src \
  larry:config-consul-cluster.src
docker-machine scp config-consul-cluster-curly.src \
  curly:config-consul-cluster.src
docker-machine scp config-consul-cluster-moe.src \
  moe:config-consul-cluster.src

docker-machine scp run-larry.sh \
  larry:run.sh
docker-machine scp run-curly.sh \
  curly:run.sh
docker-machine scp run-moe.sh \
  moe:run.sh

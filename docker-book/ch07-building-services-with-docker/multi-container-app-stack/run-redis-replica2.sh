#! /bin/bash
#

# Start the redis server replica
#
docker run -d -h redis-replica2 \
  --net express --name redis-replica2 \
  jamtur01/redis_replica

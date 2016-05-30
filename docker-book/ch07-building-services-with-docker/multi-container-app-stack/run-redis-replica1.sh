#! /bin/bash
#

# Start the redis server replica
#
docker run -d -h redis-replica1 \
  --net express --name redis-replica1 \
  jamtur01/redis_replica

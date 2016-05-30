#! /bin/bash
#

# Create the network 'express'
#
docker network create --driver=bridge express

# Start the redis server
#
docker run -d -h redis-primary \
  --net express --name redis-primary \
  jamtur01/redis_primary


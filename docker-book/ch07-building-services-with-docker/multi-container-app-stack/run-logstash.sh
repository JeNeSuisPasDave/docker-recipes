#! /bin/bash
#

# Start the logstash service
#
docker run -d --name logstash \
  --volumes-from redis-primary \
  --volumes-from nodeapp \
  jamtur01/logstash

#! /bin/bash
#

# Launch the container
#
docker run -h moe -d --name moe_distributed \
  jamtur01/distributed_client

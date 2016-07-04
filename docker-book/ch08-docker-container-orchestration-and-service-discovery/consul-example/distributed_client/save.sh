#! /bin/bash
#

# Save distributed_app to a tar file
docker save jamtur01/distributed_client:latest | gzip > \
  distributed_client-latest.image.tar.gz

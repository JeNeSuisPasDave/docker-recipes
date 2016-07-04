#! /bin/bash
#

# Save distributed_app to a tar file
docker save jamtur01/distributed_app:latest | gzip > \
  distributed_app-latest.image.tar.gz

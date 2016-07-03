#! /bin/bash
#

# Save distributed_app to a tar file
gunzip -c distributed_app-latest.image.tar.gz | docker load


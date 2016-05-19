#! /bin/bash
#

# Create and populate the data container
#
docker run --name ca_secrets -v /data/root/ca gliderlabs/alpine:latest \
  /bin/true
docker cp secrets/ca/ ca_secrets:/data/root/

# Generate the certificate
#
docker run --rm -i -t --volumes-from ca_secrets \
  --name delme_ca-cert \
  datihein/ca-cert \
  /data/root/ca/generate-ca-root-keypair.sh

# Capture results and destroy data container
#
docker cp ca_secrets:/data/root/ca/ secrets/
docker rm -v ca_secrets

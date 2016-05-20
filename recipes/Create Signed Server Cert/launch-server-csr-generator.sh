#! /bin/bash
#

# Make sure there is an argument
#

if [[ -z $1 ]]; then
  echo "ERROR: Must supply the server DNS name."
  exit
fi

# Create and populate the data container
#
docker run --name server_secrets -v /data/server gliderlabs/alpine:latest \
  /bin/true
docker cp secrets/server/ server_secrets:/data/

# Generate the certificate
#
docker run --rm -i -t --volumes-from server_secrets \
  --name delme_server-cert \
  -e CERTNAME=$1 \
  datihein/server-cert \
  /data/server/generate-server-keypair-and-csr.sh

# Capture results and destroy data container
#
docker cp server_secrets:/data/server/ secrets/
docker rm -v server_secrets

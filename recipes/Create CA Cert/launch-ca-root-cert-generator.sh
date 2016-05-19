#! /bin/bash
#
docker cp secrets/ca/ ca_secrets:/data/root/
docker run --rm -i -t --volumes-from ca_secrets \
  --name delme_ca-cert \
  datihein/ca-cert \
  /data/root/ca/generate-ca-root-cert.sh
docker cp ca_secrets:/data/root/ca/ secrets/

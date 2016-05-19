#! /bin/bash
#
docker run -t -i \
  -v /var/lib/dockerdata/root/ca:/data/root/ca \
  datihein/ca-cert \
  /bin/ash
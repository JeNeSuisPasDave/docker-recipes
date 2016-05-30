#! /bin/bash
#
# Run the tprov application
#
docker run --name tprov \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 4567:4567 \
  -d jamtur01/tprov /bin/bash -c ./bin/tprov

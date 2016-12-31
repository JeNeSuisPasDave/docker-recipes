#! /bin/bash
#

# Set the config variables
#
export DOCKER_MACHINE="none"
export DOCKER_MACHINE_WKDIR="/xyzzy"
export RSYNC_IMAGE_NAME="datihein/rsync:1.0.0"

# Create the data volume container
#
../create-dv-container.sh \
  "dv-example-tests-local" "/mnt/tests" "/mnt/tests-local" "refresh"
if (( 0 != $? )); then
  exit 2
fi

# List the data volume contents
docker run -i -t --rm \
  --volumes-from "dv-example-tests-local" \
  "alpine:3.4" /bin/ash -c "ls -lAR /mnt"
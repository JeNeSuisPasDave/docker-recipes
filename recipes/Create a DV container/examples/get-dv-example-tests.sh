#! /bin/bash
#

# Set the config variables
#
export DOCKER_MACHINE="dev-dkr"
export DOCKER_MACHINE_WKDIR="/xyzzy"
export RSYNC_IMAGE_NAME="datihein/rsync:1.0.0"

# Create the data volume container
#
UPDIR_=$( dirname "${PWD}" )
../capture-dv-container.sh \
  "dv-example-tests" "/mnt/tests" "${UPDIR_}/backup/tests"
if (( 0 != $? )); then
  exit 2
fi

# List the captured contents
#
ls -lAR "${UPDIR_}/backup/tests"

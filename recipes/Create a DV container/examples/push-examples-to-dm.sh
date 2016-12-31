#! /bin/bash
#

# Set the config variables
#
export DOCKER_MACHINE="dev-dkr"
export DOCKER_MACHINE_WKDIR="/mnt/delme"

# Create the data volume container
#
UP_DIR_=$( dirname "${PWD}" )
../push-to-docker-machine.sh \
  "${UP_DIR_}" "refresh"
if (( 0 != $? )); then
  exit 2
fi

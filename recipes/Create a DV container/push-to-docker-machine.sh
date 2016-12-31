#! /bin/bash
#

# Copyright 2016 David Hein
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Arguments:
#
#    $1: The local source directory (e.g. ${TMPDIR}/mnt/src). Required.
#    $2: "refresh" to overwrite existing files and remove extra files.
#        If not supplied then only changes get transferred. Optional.
#
#    NOTE: base directory (least significant directory) of source and
#          mount point must be identical.
#
# Config:
#
# These environment variables provide some configuration items. If not present
# then default values will be used:
#
#   DOCKER_MACHINE   This is the VM hostname of the Docker host accessible
#                    via 'docker-machine' the the client 'docker' commands.
#                    Default is "dev-dkr"
#
#   DOCKER_MACHINE_WKDIR  The directory on the Docker host into which files
#                         can be transferred from the client host. Default
#                         is "/xyzzy".
#
# Dependecies:
#
#   * requires /bin/bash (not /bin/sh or /bin/ash)
#   * requires sed
#   * requires the 'dv-sync.src' to be in the same directory as this script.
#   * Requires rsync to be installed on the local machine.
#   * Requires docker or docker-machine to be installed on the local machine.
#

# capture the script context
#
# Script name ...
#
SCRIPTNAME_="$0"

# ... get the directory holding this script
# (method from: http://stackoverflow.com/a/12694189/1392864)
#
SCRIPTDIR_="${BASH_SOURCE%/*}"
if [[ ! -d "$SCRIPTDIR_" ]]; then
  SCRIPTDIR_="$PWD"
fi

# Load the bash functions that support data volume synchronization via rsync
#
. "${SCRIPTDIR_}/dv-sync.src"

# main
#

# Capture and validate config
#
DKR_MACHINE_="dev-dkr"
if [ -n "${DOCKER_MACHINE}" ]; then
  DKR_MACHINE_="${DOCKER_MACHINE}"
fi
HOST_WK_DIR_="/xyzzy"
if [ -n "${DOCKER_MACHINE_WKDIR}" ]; then
  HOST_WK_DIR_="${DOCKER_MACHINE_WKDIR}"
fi

RESULT_=$( docker-machine ls --format='{{.Name}}' )
RESULT_=$( echo "$RESULT_" | grep ^${DKR_MACHINE_}$ )
if (( 0 != $? )); then
  echo "ERROR: '${DKR_MACHINE_}' is not an extant docker machine"
  exit 2
fi

# Capture and validate args
#
IGNORE_TIMES_DURING_RSYNC_=0
SRC_DIR_=""
if (( 2 == $# )); then
  SRC_DIR_="$1"
  if [ "refresh" != "$2" ]; then
    echo "ERROR: argument 2 must be 'refresh' or must not be supplied."
    exit 2
  fi
  IGNORE_TIMES_DURING_RSYNC_=1
elif (( 1 == $# )); then
  SRC_DIR_="$1"
else
  echo "ERROR: '${SCRIPTNAME_}' expected one or two arguments; got $#"
  exit 2
fi
if [ ! -d "${SRC_DIR_}" ]; then
  echo "ERROR: argument 1, '${SRC_DIR_}', does not exist or is not a directory"
  exit 2
fi

# initialization
#
IP_=""
if [ "none" != "${DKR_MACHINE_}" ]; then
  IP_=$( docker-machine ip ${DKR_MACHINE_} )
fi

# Create the Docker VM working directory if necessary
#
docker_host_workdir_exists "${DKR_MACHINE_}" "${HOST_WK_DIR_}"
rc_=$?
if (( 0 != $rc_ )); then
  if (( 2 == $rc_ )); then
    exit 2
  fi
  docker_host_create_workdir "${DKR_MACHINE_}" "${HOST_WK_DIR_}"
fi

# Update the host working directory
#
if [ "none" != "${HOST_WK_DIR_}" ]; then
  rsync_src_to_workdir "${DKR_MACHINE_}" "${IP_}" \
    "${SRC_DIR_}" "${HOST_WK_DIR_}" \
    "${IGNORE_TIMES_DURING_RSYNC_}"
fi

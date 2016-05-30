#! /bin/bash
#

# docker_stop_and_remove()
#
# Stop and remove each running Docker container
#
docker_stop_and_remove() {
  local CONTAINER_IDS_=( $(docker ps -q) )
  if [[ 0 < ${#CONTAINER_IDS_[@]} ]]; then
    for (( i = 0; i < ${#CONTAINER_IDS_[@]}; ++i )); do
      local id=${CONTAINER_IDS_[i]}
      docker stop $id && docker rm $id
    done
  fi
}

# Remove all running containers
#
docker_stop_and_remove

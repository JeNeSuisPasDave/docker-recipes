#! /bin/bash
#
# Create a new VirtualBox virtual machine that hosts docker
# Machine name will be 'dev-dkr'. The docker user will have bash
# as the default shell.
#
# See 'Add Bash to boot2docker image' recipe for details on how to
# customize boot2docker in that way.
#
docker-machine create --driver virtualbox \
  --virtualbox-cpu-count 2 \
  --virtualbox-memory "4096" \
  --virtualbox-disk-size "20000" \
  --virtualbox-boot2docker-url ./tmp/boot2docker-1.12.2-bash.iso \
  tst-dkr

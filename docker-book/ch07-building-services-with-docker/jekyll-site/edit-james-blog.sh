#! /bin/bash
#

# fetch the repo
#
docker run --rm -t -i -v /var/lib/dockerdata/git-projects:/var/projects \
  datihein/git-client /bin/ash

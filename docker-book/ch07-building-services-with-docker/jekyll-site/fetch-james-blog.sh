#! /bin/bash
#

# fetch the repo
#
CMD_="git clone https://github.com/jamtur01/james_blog.git"
docker run --rm -v /var/lib/dockerdata/git-projects:/var/projects \
  datihein/git-client /bin/ash -c "$CMD_"

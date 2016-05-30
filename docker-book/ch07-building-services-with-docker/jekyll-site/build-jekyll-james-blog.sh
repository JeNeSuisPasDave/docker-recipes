#! /bin/bash
#

# Build the jekyll site
#
docker run -v /var/lib/dockerdata/git-projects/james_blog:/data/ \
  --name james_blog jamtur01/jekyll

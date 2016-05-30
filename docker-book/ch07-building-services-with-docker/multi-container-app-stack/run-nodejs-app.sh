#! /bin/bash
#

# Start the nodejs Express app
#
docker run -d \
  --net express \
  --hostname nodeapp \
  --name nodeapp -p 3000:3000 \
  jamtur01/nodejs


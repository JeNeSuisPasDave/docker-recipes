#! /bin/bash
#
docker run -d -p 80 --name website \
  -v $PWD/website:/var/www/html/website:ro \
  jamtur01/nginx nginx

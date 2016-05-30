#! /bin/bash
#
docker run --rm --volumes-from james_blog \
  -v /var/lib/dockerdata/backup:/backup datihein/ubuntu:14.04.4u \
  tar cvf /backup/james_blog_backup.tar /var/www/html


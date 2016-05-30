#! /bin/bash
#
# Create the data volume for /var/lib/tomcat7/webapps
#
docker run --name dv_tomcat7_webapps \
  -v /var/lib/dockerdata/tomcat7/webapps/:/var/lib/tomcat7/webapps/ \
  gliderlabs/alpine:latest \
  /bin/true

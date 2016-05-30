#! /bin/bash
#
# Download the sample Apache Tomcat application
docker run -t -i --rm \
  --volumes-from dv_tomcat7_webapps \
  --name sample jamtur01/fetcher \
  https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war


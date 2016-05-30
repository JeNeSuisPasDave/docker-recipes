#! /bin/bash
#
# Run the Tomcat server hosting the sample web app
#
docker run -d -P --name sample_app \
  --volumes-from dv_tomcat7_webapps \
  jamtur01/tomcat7

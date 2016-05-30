# Using a base Ubuntu 14.04 that has the latest updates already
#
FROM datihein/ubuntu:14.04.4u
MAINTAINER Dave Hein <dave@example.com>

# Setting this environment variable prevents errors during package installs
# that look like:
#
# debconf: unable to initialize frontend: Dialog
# debconf: (TERM is not set, so the dialog frontend is not usable.)
# debconf: falling back to frontend: Readline
#
# As per: http://stackoverflow.com/a/35976127/1392864
#
ARG DEBIAN_FRONTEND=noninteractive

# Install wget
#
ENV WGET_REFRESHED_AT 2016-05-29T08:26-0500
RUN apt-get -yqq install wget

# Fetch some Java web app
#
VOLUME [ "/var/lib/tomcat7/webapps/" ]
WORKDIR /var/lib/tomcat7/webapps/

ENTRYPOINT [ "wget" ]
CMD [ "-?" ]

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

# Install nodejs
#
ENV NODEJS_REFRESHED_AT 2016-05-30T04:03-0500
RUN apt-get -yqq install nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install app
#
ENV NODEAPP_REFRESHED_AT 2016-05-30T05:14-0500
RUN mkdir -p /var/log/nodeapp
COPY nodeapp /opt/nodeapp/

WORKDIR /opt/nodeapp
RUN npm install

VOLUME [ "/var/log/nodeapp" ]

EXPOSE 3000

ENTRYPOINT [ "nodejs", "server.js" ]

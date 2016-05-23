# Using a base Ubuntu 14.04 that has the latest updates already
#
FROM datihein/ubuntu:14.04.4u
MAINTAINER Dave Hein "dave@example.com"

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

# installing redis
#
ENV REDIS_REFRESHED_AT 2016-05-22T09:24-0500
RUN apt-get -yqq install redis-server redis-tools

# configuring redis
#
ENV REDIS_CONFIGURED_AT 2016-05-22T09:24-0500
EXPOSE 6379

ENTRYPOINT ["/usr/bin/redis-server"]
CMD []

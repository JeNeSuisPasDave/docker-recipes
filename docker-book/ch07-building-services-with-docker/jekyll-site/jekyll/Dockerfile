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

# Install Ruby and Jekyll
#
ENV JEKYLL_REFRESHED_AT 2016-05-28T08:38-0500
RUN apt-get -yqq install ruby ruby-dev make nodejs
RUN gem install --no-rdoc --no-ri jekyll -v 2.5.3

# Create mount points and set working directory
#
ENV RUNCONFIG_REFRESHED_AT 2016-05-28T08:43-0500
VOLUME [ "/data", "/var/www/html" ]
WORKDIR /data

# Entrypoint; command executed at launch
#
ENTRYPOINT [ "jekyll", "build", "--destination=/var/www/html" ]

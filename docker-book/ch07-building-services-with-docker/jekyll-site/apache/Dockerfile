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

# Install Apache
#
ENV APACHE_REFRESHED_AT 2016-05-28T09:03-0500
RUN apt-get -yqq install apache2

# Create mount points and set working directory
#
ENV RUNCONFIG_REFRESHED_AT 2016-05-28T09:05-0500
VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

# Configure Apache
#
ENV APACHECONFIG_REFRESHED_AT 2016-05-28T09:06-0500
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

# Public port, entrypoint (command executed at launch)
#
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2" ]
CMD ["-D", "FOREGROUND"]

# Using a base Ruby 2.3 image
#
FROM ruby:2.3
MAINTAINER Dave Hein <dave@example.com>

# Get repository indexes up to date
#
ENV APT_REFRESHED_AT 2016-05-29T14:29-0500
RUN apt-get -yqq update

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

# Add Docker client
#
ENV DOCKER_CLIENT_REFRESHED_AT=2016-05-29T18:33-0500
RUN apt-get install -qqy curl apt-transport-https
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo deb https://apt.dockerproject.org/repo ubuntu-trusty main \
  > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy docker-engine

# Install the tprov gem
#
ENV TPROV_REFRESHED_AT 2016-05-29T21:45-0500
ADD tprov /var/lib/src/gems/tprov
WORKDIR /var/lib/src/gems/tprov
RUN gem build tprov.gemspec && gem install --no-rdoc --no-ri tprov-0.0.4.gem

EXPOSE 4567

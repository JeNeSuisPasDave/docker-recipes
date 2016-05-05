# Base images can be found here: https://hub.docker.com/_/ubuntu/
# Ubuntu 14.04 LTS (Trusty Tahr) is supported through 2019.
# Ubuntu 16.04 LTS (Xenial Xerus) has just been released and probably should
#   not be used yet (because dependent software may need to be updated and
#   made compatible).
#
FROM ubuntu:14.04.4

MAINTAINER  Dave Hein <dave.hein@aspentech.com>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-04T20:35-0500

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

# Update apt package info and upgrade installed packages (base image
# has some packages installed)
#
RUN apt-get update && apt-get -y upgrade

# Install Ruby and Sinatra (latest of each)
#
# Note: need ruby-dev and make to build the native extensions for rdoc
# Note: need rdoc to avoid errors when installing sinatra, errors like:
#
#   unable to convert "\xC3" to UTF-8 in conversion from ASCII-8BIT to UTF-8 to US-ASCII for README.rdoc, skipping
#
# Alternatively we could "gem install sinatra --no-rdoc --no-ri". That would also
# take less time (sinatra is pretty big as it is).
#
RUN apt-get install -y ruby
RUN apt-get install -y ruby-dev
RUN apt-get install -y make
RUN gem update
RUN gem install rdoc && gem rdoc --all --overwrite
RUN gem install sinatra

# Add the web app to the image
#
RUN mkdir /app
ADD hello_world.rb /app/

# Set some environment variables
#
ENV PORT 8000
ENV RACK_ENV production

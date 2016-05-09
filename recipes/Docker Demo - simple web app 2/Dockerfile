FROM datihein/ubuntu:updated

MAINTAINER  Dave Hein <dave.hein@aspentech.com>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-09T17:40-0500

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

# Download an updated rubygems
#
# RUN apt-get install -y curl
# RUN mkdir /tmp
RUN gem update

# Update to rubygems with current certificate
# (Note: don't need to uninstall because 'update_rubygems' will uninstall
#        the rubygems-update gem.)
#
RUN gem install rubygems-update -v 1.8.30
RUN update_rubygems

RUN gem install rdoc && gem rdoc --all --overwrite
RUN gem install sinatra

# Create a user to run the web server
#
RUN useradd -m -s /bin/bash webby
USER webby
WORKDIR /home/webby

# Add the web app to the image
#
RUN mkdir /home/webby/app
ADD hello_world.rb /home/webby/app/

# Set some environment variables
#
ENV PORT 8000
ENV RACK_ENV production


# SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.


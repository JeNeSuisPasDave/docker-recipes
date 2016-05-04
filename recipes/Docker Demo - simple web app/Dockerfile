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
REFRESHED_AT 2016-05-04T13:42-0500

# Update apt package info and upgrade installed packages (base image
# has some packages installed)
#
RUN apt-get update && apt-get -y upgrade

# Install Ruby and Sinatra (latest of each)
#
RUN apt-get install -y ruby
RUN gem install sinatra

# Add the web app to the image
#
RUN mkdir /app
ADD hello_world.rb /app/

# Set some environment variables
#
ENV PORT 8000
ENV RACK_ENV production

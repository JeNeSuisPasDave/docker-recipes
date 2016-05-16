FROM ruby:2.3-alpine

MAINTAINER  Dave Hein <dave.hein@aspentech.com>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-09T17:40-0500
RUN apk update && apk upgrade

RUN gem update
ARG alt_gem_src
#
# ERROR:  While executing gem ... (Gem::RemoteFetcher::FetchError)
#    too many connection resets (http://rubygems.global.ssl.fastly.net/gems/rack-1.6.4.gem)
#
ARG alt_gem_src
RUN gem sources --add $alt_gem_src
#
RUN gem install rdoc && gem rdoc --all --overwrite
RUN gem install sinatra
#
RUN gem sources --remove $alt_gem_src


ENV FILES_AT 2016-05-16T08:52-0500
# Fix file permissions because we are copying from Windows
#
# SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
#
RUN mkdir delme
COPY fix-permissions.sh delme/
RUN chmod 744 delme/fix-permissions.sh
RUN mkdir delme/app
COPY hello_world.rb delme/app/
WORKDIR /delme/app
RUN ../fix-permissions.sh

# Create a user to run the web server
#
RUN addgroup webby
RUN adduser -S webby -G webby -s /bin/ash -h /home/webby

# Add the web app to the image
#
USER webby
WORKDIR /home/webby
RUN cp -R /delme/app /home/webby

# Remove the scratch area
#
USER root
WORKDIR /
RUN rm -rf /delme

# Set the user and working directory
#
USER webby
WORKDIR /home/webby

# Set some environment variables
#
ENV PORT 8000
ENV RACK_ENV production




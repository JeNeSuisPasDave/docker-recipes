FROM ruby:2.3

MAINTAINER  Dave Hein <dhein@acm.org>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-12T04:27-0500

# throw errors if Gemfile has been modified since Gemfile.lock
#

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV BUNDLE_AT 2016-05-12T04:27-0500
COPY geminabox/ /usr/src/app
RUN bundle install
RUN bundle config --global frozen 1

ENV GEMINABOX_AT 2016-05-12T04:27-0500
# ########################################
# These commands are from the geminabox Dockerfile
#
# RUN mkdir data
EXPOSE 9292
ENTRYPOINT ["rackup", "--host", "0.0.0.0"]

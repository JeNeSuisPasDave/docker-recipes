# Very small Docker image that provides git CLI client
#
FROM gliderlabs/alpine:3.3
MAINTAINER Dave Hein <dave@example.com>

# To void the cache beyond the base image, change time string to current time
#
ENV GIT_REFRESHED_AT 2016-05-28T09:41-0500
RUN apk update && apk-install git

# Mountpoint for the project
#
ENV MOUNTPOINT_REFRESHED_AT 2016-05-28T09:52-0500
VOLUME /var/projects
WORKDIR /var/projects

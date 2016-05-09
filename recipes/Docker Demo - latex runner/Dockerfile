# Base images can be found here: https://hub.docker.com/_/ubuntu/
# Ubuntu 14.04 LTS (Trusty Tahr) is supported through 2019.
# Ubuntu 16.04 LTS (Xenial Xerus) has just been released and probably should
#   not be used yet (because dependent software may need to be updated and
#   made compatible).
#
FROM datihein/ubuntu:updated

MAINTAINER  Dave Hein <dave.hein@aspentech.com>

# To void the cache beyond the base image, change REFRESHED_AT to current time
#
ENV REFRESHED_AT 2016-05-08T15:42-0500

# install texlive
#
RUN apt-get install -y texlive-latex-base

# start in the tmp directory
#
WORKDIR /tmp

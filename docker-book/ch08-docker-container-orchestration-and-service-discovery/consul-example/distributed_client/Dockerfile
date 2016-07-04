FROM datihein/ruby:2.3.1
MAINTAINER Dave Hein "dave@example.com"
ENV REFRESHED_AT 2016-07-03T14:16:00-0500

ARG DEBIAN_FRONTEND=noninteractive

RUN gem install --no-ri --no-rdoc json

RUN mkdir -p /opt/distributed_client
COPY client.rb /opt/distributed_client/

WORKDIR /opt/distributed_client

ENTRYPOINT [ "ruby", "/opt/distributed_client/client.rb" ]
CMD []

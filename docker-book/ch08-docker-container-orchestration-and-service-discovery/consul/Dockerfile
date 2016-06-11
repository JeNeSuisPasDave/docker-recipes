FROM ubuntu:14.04
MAINTAINER James Turnbull <james@example.com>
ENV REFRESHED_AT 2014-08-01

RUN apt-get -qqy update
RUN apt-get -qqy install curl unzip

ENV CONSUL_REFRESHED_AT 2016-06-11T17:08-0500
# ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /tmp/consul.zip
COPY consul_0.6.3_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip

# ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /tmp/webui.zip
# RUN cd /tmp/ && unzip webui.zip && mv dist/ /webui/
# COPY consul_0.6.3_web_ui.zip /tmp/webui.zip
# RUN mkdir /webui && cd /webui && unzip /tmp/webui.zip

ENV CONSUL_CONFIG_REFRESHED_AT 2016-06-11T17:11-0500
COPY consul.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

VOLUME ["/data"]

ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config" ]
CMD []

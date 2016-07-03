#! /bin/sh
#
sudo docker run -d -h $HOSTNAME \
  -p 8300:8300 -p 8301:8301 \
  -p 8301:8301/udp -p 8302:8302 \
  -p 8302:8302/udp -p 8400:8400 \
  -p 8500:8500 -p 53:53/udp \
  --name moe_agent jamtur01/consul \
  -server -advertise $PUBLIC_IP -join $JOIN_IP

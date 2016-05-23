#! /bin/bash
#
IP_=$(docker-machine ip dev-dkr)
open http://$IP_:8080/

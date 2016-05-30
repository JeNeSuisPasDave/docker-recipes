FROM jamtur01/redis
MAINTAINER James Turnbull <james@example.com>

ENV REDIS_PRIMARY_REFRESHED_AT 2016-05-30T04:14-0500

ENTRYPOINT [ "redis-server", "--logfile /var/log/redis/redis-replica.log", "--slaveof redis-primary 6379" ]

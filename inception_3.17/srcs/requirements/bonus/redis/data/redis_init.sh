#!/bin/sh

node_exporter &
sleep 1
exec redis-server --requirepass $WP_REDIS_PASSWD
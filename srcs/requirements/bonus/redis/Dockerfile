FROM alpine:3.17

RUN apk update
RUN apk add openrc redis prometheus-node-exporter
RUN mv /etc/redis.conf /etc/redis.conf.back
COPY conf/redis.conf /etc/redis.conf
COPY data/redis_init.sh /tmp/redis_init.sh
RUN chmod +x /tmp/redis_init.sh

CMD ["/tmp/redis_init.sh"]
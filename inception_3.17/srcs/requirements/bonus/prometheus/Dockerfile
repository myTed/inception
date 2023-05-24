FROM alpine:3.17

RUN apk update
RUN apk add prometheus
RUN mkdir /data
WORKDIR /data
COPY data/prometheus_init.sh /tmp/prometheus_init.sh
RUN chmod +x /tmp/prometheus_init.sh
COPY conf/prometheus.yml /etc/prometheus/prometheus.yml

CMD ["/tmp/prometheus_init.sh"]

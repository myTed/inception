FROM alpine:3.17

RUN mkdir -p /data/www /etc/nginx/certs

RUN apk update
RUN apk add nginx

COPY ./conf/my.conf /etc/nginx/http.d/

RUN  mkdir static
COPY static /static/

WORKDIR /etc/nginx/certs

RUN apk add openssl &&\
    openssl genrsa -out server.key 2048 &&\
    openssl req -new -key server.key -out server.csr -subj "/C=KR/ST=Seoul/L=Gaepo/O=42seoul Inc./CN=kyolee.42.fr" &&\
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

COPY data/nginx_init.sh /tmp
RUN  chmod +x /tmp/nginx_init.sh

CMD [ "/tmp/nginx_init.sh" ]
#CMD ["nginx"]
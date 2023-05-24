FROM alpine:3.17

RUN apk update
#for php-fpm
RUN apk add php php81-mysqli php81-fpm php81-session
RUN addgroup www_data && adduser -D -h /home/www_data -G www_data www_data
RUN mkdir -p /data/adminer && chown -R www_data:www_data /data/adminer
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY data/test1.php /data/adminer/test1.php

WORKDIR /data/adminer
COPY data/adminer_init.sh /tmp/adminer_init.sh
RUN chmod +x /tmp/adminer_init.sh

CMD ["/tmp/adminer_init.sh"]

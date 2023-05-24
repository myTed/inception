FROM alpine:3.17

RUN apk update
#for php-fpm
RUN apk add php php81-mysqli php81-fpm php81-gd php81-xml mysql-client php81-dom
#for wp-cli
RUN apk add php81-mbstring php81-iconv php81-phar postfix
#for redis
RUN apk add php81-redis redis php81-ctype

RUN apk add openrc nmap-ncat
RUN mkdir -p /run/openrc && mkdir -p /data/ && mkdir -p /usr/log/php8
RUN touch /run/openrc/softlevel
RUN addgroup www_data && adduser -D -h /home/www_data -G www_data www_data
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY data/wp_init.sh /tmp/wp_init.sh
RUN chmod +x /tmp/wp_init.sh
COPY conf/wp-config.php /tmp/
RUN  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
WORKDIR /data


CMD ["/tmp/wp_init.sh"]

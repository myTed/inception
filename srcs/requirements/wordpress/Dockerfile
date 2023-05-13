FROM alpine:3.16

RUN apk update

#RUN apt-get install php php-fpm -y && apt-get install curl mariadb-client php7.4-fpm php7.4-mysql php7.4-curl php7.4-json -y 

#RUN apt install -y php php-fpm php-mysql php-xml 
#php-xmlrpc php-xml-htmlsax3 php-xml-svg
RUN apk add php && apk add php8-mysqli && apk add php8-fpm && apk add php8-gd && apk add php8-xml
#&& apk add xmlrpc-c-dev && apk add xmlrpc-c-tools && apk add php8-pecl-mcrypt
#RUN apk add php8-fpm lighttpd php8-common php8-session php8-iconv php8-json php8-gd php8-curl php8-xml php8-mysqli php8-imap php8-cgi fcgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap php8-ctype php8-dom php8-simplexml
#RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml



RUN apk add openrc

RUN mkdir -p /run/openrc && mkdir -p /data && mkdir -p /usr/log/php8
RUN touch /run/openrc/softlevel
#RUN mkdir -p /data
#RUN groupadd www_data && useradd -d /home/www_data -g www_data www_data && chown -R www_data:www_data /data
RUN addgroup www_data && adduser -D -h /home/www_data -G www_data www_data && chown -R www_data:www_data /data
WORKDIR /data
#RUN sed -i s/127.0.0.1:9000/wordpress_app:9000/g /etc/php8/php-fpm.d/www.conf
CMD ["php-fpm8", "-F", "-O"];
#CMD ["/bin/sh"]
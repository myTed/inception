FROM debian:buster

RUN apt update
RUN mkdir /data
RUN apt install -y vsftpd lftp tini
RUN mv /etc/vsftpd.conf /etc/vsftpd.conf.back
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY data/ftp_init.sh /tmp/ftp_init.sh
RUN chmod +x /tmp/ftp_init.sh

CMD ["/tmp/ftp_init.sh"]

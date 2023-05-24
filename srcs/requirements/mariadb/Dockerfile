FROM debian:buster

RUN apt update
RUN apt-get install apt-transport-https curl -y
RUN curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'
RUN sh -c "echo 'deb https://tw1.mirror.blendbyte.net/mariadb/repo/10.6/debian buster main' >>/etc/apt/sources.list"
RUN apt-get install mariadb-server ncat -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-client.cnf /etc/mysql/mariadb.conf.d/50-client.cnf
RUN mkdir /tmp/mysqld && chown -R mysql:mysql /tmp/mysqld
COPY data/db_init.sh /tmp/db_init.sh
RUN chmod +x /tmp/db_init.sh


CMD ["/tmp/db_init.sh"]

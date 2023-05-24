#!/bin/sh

if [ -d /data/mysqld_exporter ]; then
    echo "Already installed mysqld_exporter"
else
    cd /data
    wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.15.0-rc.0/mysqld_exporter-0.15.0-rc.0.linux-amd64.tar.gz
    tar xf mysqld_exporter-0.15.0-rc.0.linux-amd64.tar.gz
    mv mysqld_exporter-0.15.0-rc.0.linux-amd64 mysqld_exporter
    rm -rf mysqld_exporter-0.15.0-rc.0.linux-amd64.tar.gz
    echo "new installed mysqld_exporter"
fi

if [ ! -f /data/my.cnf ]; then
cat<<EOF>my.cnf
[client]
user = $GF_MYSQL_USER
password = $GF_MYSQL_PASSWD
host = db_app
EOF
fi

/data/mysqld_exporter/mysqld_exporter --config.my-cnf=/data/my.cnf &
sleep 1

exec prometheus --config.file=/etc/prometheus/prometheus.yml
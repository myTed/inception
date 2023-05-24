#! /bin/bash

#check user and create user
check_user()
{
    local userName=$(mysql -u root -p$MYSQL_ROOT_PWD -e "select user FROM mysql.user WHERE user='$MYSQL_USER'" | grep $MYSQL_USER)
    if [ -n "$userName" ]; then
        echo "[db_init] found user : $userName";
    else
        echo "[db_init] not found user and create user!";
        mysql -u root -p$MYSQL_ROOT_PWD -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PWD'"
        echo "[db_init] finish create user!";
    fi
}

#check db and create db
check_db()
{
    local dbName=$(mysql -u root -p$MYSQL_ROOT_PWD -e "SHOW DATABASES" | grep $MYSQL_DB_NAME)

    if [ -n "$dbName" ]; then
        echo "[db_init] found Database : $dbName";
    else
        echo "[db_init] not found database and create database $MYSQL_DB_NAME";
        mysql -u root -p$MYSQL_ROOT_PWD -e "CREATE DATABASE $MYSQL_DB_NAME"
        mysql -u root -p$MYSQL_ROOT_PWD -e "grant all privileges on $MYSQL_DB_NAME.*to $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_USER_PWD'"
        mysql -u root -p$MYSQL_ROOT_PWD -e "FLUSH privileges;"
        echo "[db_init] finish create database $MYSQL_DB_NAME!";
    fi
}

check_exporter()
{
    local userName=$(mysql -u root -p$MYSQL_ROOT_PWD -e "select user FROM mysql.user WHERE user='$GF_MYSQL_USER'" | grep $GF_MYSQL_USER)
    if [ -n "$userName" ]; then
        echo "[db_init] found user : $userName";
    else
        echo "[db_init] not found user and create user!";
        mysql -u root -p$MYSQL_ROOT_PWD -e "CREATE USER '$GF_MYSQL_USER'@'%' IDENTIFIED BY '$GF_MYSQL_PASSWD' WITH MAX_USER_CONNECTIONS 3"
        mysql -u root -p$MYSQL_ROOT_PWD -e "GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO '$GF_MYSQL_USER'@'%'"
        mysql -u root -p$MYSQL_ROOT_PWD -e "FLUSH privileges;"
        echo "[db_init] finish create user!";
    fi
}

#deamon start for check_setup
date "+%H:%M:%S"
echo "[db_init] check user and database";
mysqld &
sleep 2

#set root passwd
if [ ! -f /etc/mysql/my.cnf ]; then
    mysql -u root -e "set password for 'root'@'localhost'=password('$MYSQL_ROOT_PWD'); flush privileges";
fi

#call
check_user
check_exporter
check_db

#deameon end
killall mysqld
sleep 2
echo "[db_init] check end";

#exec mariadb server
echo "[db_init] start mariadb server";
#send message that "mariadb server is starting.." to wordpress_app container.
date "+%H:%M:%S"
echo "[db_init] start mariadb server" | ncat wordpress_app 1234
#exec /usr/sbin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/x86_64-linux-gnu/mariadb19/plugin --user=mysql
exec /usr/sbin/mysqld

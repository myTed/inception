#!/bin/sh

time_echo()
{
    local time=$(date +"%H:%M:%S")
    local prompt=$1
    local message=$2
    echo "[$prompt : $time] $message"
}

#check wordpress and install wordpress
check_wordpress()
{
    if [ -f "$WP_FOLDER_PATH/$WP_CONFIG_FILE_NAME" ]; then
        time_echo "[wp_init]" "already installed $WP_NAME";
    else
        time_echo "[wp_init]" "$WP_NAME install start!"
        wp core download --path=$WP_NAME --locale=$WP_LOCALE
        cd wordpress
        #설정 파일 만들기
        wp config create --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PWD --dbhost=srcs-db_app-1
        #관리자 계정 및 홈페이지 설정
        wp core install --url=$DOMAIN_NAME --title=$WP_HOMEPAGE_NAME --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path=$WP_FOLDER_PATH
        #사용자 계정 추가
        wp user create $WP_PLAIN_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD --user_url=$DOMAIN_NAME --path=$WP_FOLDER_PATH
        #설정 파일 등록
        mv wp-config.php wp-config.php.back
        mv /tmp/wp-config.php .
        wp plugin install redis-cache --activate --path=/data/wordpress
        wp redis enable
        
        time_echo "[wp_init]" "redis enable"
    fi
}


#start ncat server
#which waits for a message that mariadb server is staring..
time_echo "[wp_init]" "start ncat server"
ncat -l -p 1234
time_echo "[wp_init]" "message recived"

#check wordpresss and install wordpress
check_wordpress
chown -R www_data:www_data /data

#start e-mail server
postfix start &
sleep 2

#start php-fpm
exec php-fpm81 -F;

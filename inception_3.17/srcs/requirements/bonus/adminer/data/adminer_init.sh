#!/bin/sh

if [ -f /data/adminer/index.php ]; then
    echo "Already found index.php"
else
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php
    mv adminer-4.8.1-mysql.php index.php
    echo "Install adminer"
fi

exec php-fpm81 -F
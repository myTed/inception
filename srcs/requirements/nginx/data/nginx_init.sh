#!/bin/sh

if [ -d /data/static ]; then
    echo "Already Stored static page"
else
    mv /static /data
    echo "move static page"
fi

exec nginx -g "daemon off;"

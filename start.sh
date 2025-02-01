#!/bin/bash

USERNAME=${BASIC_AUTH_USERNAME:-default_username}
PASSWORD=${BASIC_AUTH_PASSWORD:-default_password}

mkdir -p /tmp/nginx/conf/
mkdir -p /tmp/nginx/logs/

echo "$USERNAME:$(openssl passwd -apr1 $PASSWORD)" > /tmp/nginx/.htpasswd_env

cp config/nginx.conf.erb /tmp/nginx/conf/nginx.conf

# node server.js &

# NGINXをスタート
nginx -p /tmp/nginx/ -c /tmp/nginx/conf/nginx.conf -g "daemon off;"

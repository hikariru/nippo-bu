#!/bin/bash

USERNAME=${BASIC_AUTH_USERNAME:-default_username}
PASSWORD=${BASIC_AUTH_PASSWORD:-default_password}

mkdir -p /etc/nginx/
mkdir -p /tmp/nginx/conf/
mkdir -p /tmp/nginx/logs/

echo "$USERNAME:$(openssl passwd -apr1 $PASSWORD)" > /etc/nginx/.htpasswd_env

# node server.js &

# NGINXをスタート
exec nginx -g "daemon off;"

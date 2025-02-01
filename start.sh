#!/bin/bash

USERNAME=${BASIC_AUTH_USERNAME:-default_username}
PASSWORD=${BASIC_AUTH_PASSWORD:-default_password}

echo "$USERNAME:$(openssl passwd -crypt $PASSWORD)" > /etc/nginx/.htpasswd_env

# NGINXをスタート
exec nginx -g "daemon off;"

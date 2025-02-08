#!/bin/bash

USERNAME=${BASIC_AUTH_USERNAME:-default_username}
PASSWORD=${BASIC_AUTH_PASSWORD:-default_password}

chmod 1777 /tmp

echo "$USERNAME:$(openssl passwd -apr1 $PASSWORD)" > /tmp/.htpasswd

bin/start-nginx npm start

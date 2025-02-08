#!/bin/bash

USERNAME=${BASIC_AUTH_USERNAME:-default_username}
PASSWORD=${BASIC_AUTH_PASSWORD:-default_password}

chmod 1777 /tmp

echo "$USERNAME:$(openssl passwd -apr1 $PASSWORD)" > /tmp/.htpasswd

if [ -f /tmp/.htpasswd ]; then
    echo "/tmp/.htpasswd successfully created. Content:"
    cat /tmp/.htpasswd
else
    echo "Failed to create /tmp/.htpasswd"
    exit 1
fi

bin/start-nginx npm start

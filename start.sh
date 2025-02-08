#!/bin/bash

chmod 1777 /tmp

echo "$BASIC_AUTH_USERNAME:$(openssl passwd -crypt $BASIC_AUTH_PASSWORD)" > /tmp/.htpasswd

chown root:nobody /tmp/.htpasswd
chmod 640 /tmp/.htpasswd

bin/start-nginx npm start

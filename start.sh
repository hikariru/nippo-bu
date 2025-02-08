#!/bin/bash

chmod 1777 /tmp

echo "$BASIC_AUTH_USERNAME:$(openssl passwd -crypt $BASIC_AUTH_PASSWORD)" > /tmp/.htpasswd

bin/start-nginx npm start

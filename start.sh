#!/bin/bash

chmod 1777 /tmp

echo "${BASIC_AUTH_USERNAME}:$(openssl passwd -apr1 ${BASIC_AUTH_PASSWORD})" > /tmp/.htpasswd

bin/start-nginx-debug npm start

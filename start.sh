#!/bin/bash

chmod 1777 /etc/nginx

echo "$USERNAME:$(openssl passwd -crypt $PASSWORD)" > /etc/nginx/.htpasswd_env

bin/start-nginx npm start

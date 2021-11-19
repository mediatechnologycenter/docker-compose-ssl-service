#!/usr/bin/env sh
export DOLLAR='$'
envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/templates/nginx.conf.template
nginx -g "daemon off;"
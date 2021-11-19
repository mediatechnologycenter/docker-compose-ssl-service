#!/usr/bin/env sh
export DOLLAR='$'
envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
#!/usr/bin/env sh
export DOLLAR='$'
envsubst < nginx.conf.template > /etc/nginx/nginx.conf
nginx -g "daemon off;"
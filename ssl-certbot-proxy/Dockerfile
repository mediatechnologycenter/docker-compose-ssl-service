FROM nginx:stable-alpine

ENV NGINX_REROUTE=https://\$host\$request_uri
ENV NGINX_HOST=\$host
# Copy the nginx config file to be used in docker container
COPY deployment/default.conf.template /etc/nginx/templates/default.conf.template
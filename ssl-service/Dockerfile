FROM nginx:stable-alpine

ENV NGINX_REROUTE=https://\$host\$request_uri
ENV NGINX_HOST=\$host
# Copy the nginx config file to be used in docker container
COPY deployment/nginx.conf.template /etc/nginx/templates/nginx.conf.template
# We want to wait for the certbot certificate to be loaded
COPY deployment/wait-for-certbot.sh /docker-entrypoint.d/00-wait-for-certbot.sh
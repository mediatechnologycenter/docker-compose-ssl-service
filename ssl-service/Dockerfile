FROM nginx:stable-alpine
# Copy the nginx config file to be used in docker container
# COPY deployment/nginx.default.conf /etc/nginx/conf.d/default.conf
COPY deployment/nginx.default.conf.template /etc/nginx/templates/default.conf.template
# We want to wait for the certbot certificate to be loaded
COPY deployment/wait-for-certbot.sh /docker-entrypoint.d/00-wait-for-certbot.sh
FROM nginx:stable-alpine
# Copy the nginx config file to be used in docker container
COPY deployment/nginx.conf.template /etc/nginx/templates/nginx.conf.template
# We want to wait for the certbot certificate to be loaded
COPY deployment/wait-for-certbot.sh /docker-entrypoint.d/00-wait-for-certbot.sh

COPY deployment/run_nginx.sh /src/scripts/run_nginx.sh

RUN chmod +x /src/scripts/run_nginx.sh
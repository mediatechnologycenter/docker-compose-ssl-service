FROM nginx:stable

# Variables required by nginx templates
ENV NGINX_REROUTE=https://\$host\$request_uri
ENV NGINX_HOST=\$host

# Default configuration
ENV CLIENT_MAX_BODY_SIZE="100M"
ENV NGINX_TIMEOUT="300"

# Support backwards compatibility
# Set an alias for ENTRYPOINT_URL to FRONTEND_URL
ENV ENTRYPOINT_URL=${ENTRYPOINT_URL:-"$FRONTEND_URL"}

RUN apt-get update -y && \
    apt-get install bash -y

SHELL ["/bin/bash", "-c"]

# Copy templates for both ssl-enabled & ssl.disabled proxies to template folder
COPY deployment/default.conf.ssl.enabled.template deployment/default.conf.ssl.disabled.template /etc/nginx/templates/

# Copy custom entrypoint
# COPY deployment/wait-for-certbot.sh /docker-entrypoint.d/00-wait-for-certbot.sh
COPY deployment/999-ssl-service-entrypoint.sh /docker-entrypoint.d/
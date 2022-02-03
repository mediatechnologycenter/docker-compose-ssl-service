#   Copyright 2021 ETH Zurich, Media Technology Center
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

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
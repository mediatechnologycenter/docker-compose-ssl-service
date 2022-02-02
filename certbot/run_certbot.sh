#!/bin/bash

SSL_ENABLED=$(echo "$SSL_ENABLED" | awk '{print tolower($0)}')

echo "$SSL_ENABLED: $SSL_ENABLED"
echo "BASE_URL: $BASE_URL"
echo "SSL_EMAIL: $SSL_EMAIL"

if [ "$SSL_ENABLED" == "true" ]; then
  certbot certonly -n --standalone --agree-tos --email "${SSL_EMAIL}" -d "${BASE_URL}" -d "www.${BASE_URL}"

else
  echo "SSL is disabled, skipping certbot certificate request"

fi

# Keep alive
tail -f /dev/null
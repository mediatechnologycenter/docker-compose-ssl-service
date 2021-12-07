#!/bin/bash

# After 60 seconds the loop will exit
timeout=60
sleep_time=5
export cert_dir=/etc/letsencrypt/live

# Move all nginx configs to home dir - copy from here to select applicable config
mkdir -p /nginx_conf
mv /etc/nginx/conf.d/* /nginx_conf

wait_for_cert () {
  echo "waiting for certificate"
  until [ -d $cert_dir ]; do
    # When the timeout is equal to zero, show an error and leave the loop.
    if [ "$timeout" -le 0 ]; then
      echo "ERROR: Timeout while waiting for certbot certificates."
      exit 1
    fi
    sleep $sleep_time
    # Decrease the timeout of one
    timeout=$((timeout-sleep_time))
  done

  echo "SSL certificate is now available - restarting the service in order to start proxy on port 443"
  # Kill container's main process in order to restart it
  kill 1
}

SSL_ENABLED=$(echo "$SSL_ENABLED" | awk '{print tolower($0)}')
echo "ssl_enabled: $SSL_ENABLED"

# If ssl enabled and cert available
if [ "$SSL_ENABLED" == "true" ] && [ -d $cert_dir ]; then
  echo "SSL is enabled - setting up proxy on port 80 and 443"

  # Enable ssl enabled configuration
  cp /nginx_conf/default.conf.ssl.enabled /etc/nginx/conf.d/default.conf

else
  # Enable ssl disabled configuration
  cp /nginx_conf/default.conf.ssl.disabled /etc/nginx/conf.d/default.conf

  if [ "$SSL_ENABLED" != "true" ]; then
    echo "SSL is disabled - setting up proxy on port 80"

  else
    echo "SSL is enabled but no certificate was found - starting proxy on port 80 and waiting for certificate to be available"

    wait_for_cert &
  fi
fi

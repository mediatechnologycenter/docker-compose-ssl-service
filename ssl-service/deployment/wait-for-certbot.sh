# After 60 seconds the loop will exit
timeout=60
sleep_time=5
filename=/etc/letsencrypt/live

echo "Waiting for ssl certificate..."

until [ -d $filename ];
do
  # When the timeout is equal to zero, show an error and leave the loop.
  if [ "$timeout" == 0 ]; then
    echo "ERROR: Timeout while waiting for certbot certificates."
    exit 1
  fi
  sleep $sleep_time
  # Decrease the timeout of one
  timeout=$((timeout-sleep_time))
done

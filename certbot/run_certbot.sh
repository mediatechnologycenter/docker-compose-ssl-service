#!/bin/bash

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
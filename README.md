# ssl-certificate-docker-service
<img src="https://img.shields.io/static/v1?label=status&message=in-review&color=orange">

A standalone docker SSL service for terminating SSL connections. It is mainly supposed to forward SSL terminated requests to a project's frontend using http, where requests can be further forwarded to the respective backends.

## Overview
<img src="example-frontend/SSL-Service-Overview.png" width="500" alt="ssl-overview">

## How to use it
1. Add the two following services to your docker-compose files: `ssl-service` & `certbot`
```yaml
  ssl-service:
    image: europe-west6-docker.pkg.dev/mtc-dev/mtc-ethz/ssl-service
    container_name: ssl-service
    ports:
      - "443:443"
      - "80:80"
    volumes:
      - "letsencrypt:/etc/letsencrypt"
    env_file:
      - .env
    restart: unless-stopped

  certbot:
    image: europe-west6-docker.pkg.dev/mtc-dev/mtc-ethz/ssl-service-certbot
    container_name: certbot
    env_file:
      - .env
    volumes:
      - "letsencrypt:/etc/letsencrypt"
```

2. Copy the following variables to your project's `.env` file and edit them with your data.
```conf
### SSL variables
SSL_ENABLED = False
BASE_URL = test-dev.mediatechnologycenter.ch
SSL_EMAIL = mtc@inf.ethz.ch
FRONTEND_URL = http://frontend:80

### Optional nginx variables
# CLIENT_MAX_BODY_SIZE = "200M"
# NGINX_TIMEOUT = 300
```

3. Run `docker-compose up --build`.

Note: The SSL service can be disabled by setting `SSL_ENABLED` to `False`, in which case the `ssl-service` acts as a pure proxy.

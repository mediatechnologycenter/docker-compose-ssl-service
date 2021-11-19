# ssl-certificate-docker-service

A standalone docker ssl service. It can be attached to the regular front-end application through port 81.

## Overview
<img src="example-frontend/SSL-Service-Overview.png" width="500" alt="ssl-overview">

## How to use it

1. Add the folder certbot and ssl-service to your service folder structure. You can also clone it but be careful with the build folder directories in the docker-compose file.

2. Add the two services `ssl-service` and `certbot` to your docker-compose file.

3. Add the ssl-variables to your `.env`-file or copy the existing one. Obviously adjust them to your website.
```conf
##### SSL ENV VARIABLES ###### 
BASE_URL = test-dev.mediatechnologycenter.ch
WWW_URL = www.test-dev.mediatechnologycenter.ch
SSL_EMAIL = marcwi@inf.ethz.ch
FRONTEND_PORT = 81
```
4. Add the right port, restart and depends-on policy to your frontend service:
```yml
  frontend:
    build: ./your-frontend-service-folder
    ports:
      - ${FRONTEND_PORT?err}:${FRONTEND_PORT?err}
    restart: unless-stopped
    depends_on:
      - ssl-service
```
5. Run docker-compose up as you are used to, or define it with a specific profile.
6. Enjoy!


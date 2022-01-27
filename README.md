# ssl-certificate-docker-service
<img src="https://img.shields.io/static/v1?label=status&message=in-review&color=orange">

A standalone docker SSL service for terminating SSL connections. It is mainly supposed to forward SSL terminated requests to a project's frontend using http, where requests can be further forwarded to the respective backends.

## Overview
<img src="example-frontend/SSL-Service-Overview.png" width="500" alt="ssl-overview">

## How to use it
1. Add the two following services to your docker-compose files: `ssl-service` & `certbot`
```yaml
  ssl-service:
    image: mtcpartners/ssl-service:latest
    container_name: ssl-service
    build: ./ssl-service
    ports:
      - "443:443"
      - "80:80"
    volumes:
      - "letsencrypt:/etc/letsencrypt"
    env_file:
      - .env
    restart: unless-stopped

  certbot:
    image: mtcpartners/certbot:latest
    container_name: certbot
    build: ./certbot
    env_file:
      - .env
    volumes:
      - "letsencrypt:/etc/letsencrypt"
    
  volumes:
    - "letsencrypt:/etc/letsencrypt"
```

2. Copy the following variables to your project's `.env` file and edit them with your data.
```conf
### SSL variables
SSL_ENABLED = False
BASE_URL = test-dev.mediatechnologycenter.ch
SSL_EMAIL = mtc@inf.ethz.ch
ENTRYPOINT_URL = http://frontend:81

### Optional nginx variables
# CLIENT_MAX_BODY_SIZE = "200M"
# NGINX_TIMEOUT = 300
```
3. Be sure that your entrypoint_url is the same as your primary frontend or backend server. 
   `http://<service-name>:<server-port>`
   Run `docker-compose pull` followed by `docker-compose up` on your local machine to test it.
   After that you can check `localhost:80` in your browser. 
   Try `localhost:80/api/liveness`

### ENV Variables documentation
`BASE_URL` describes the DNS name for which a certificate should be retrieved. Make sure the DNS entry actually points to the machine the service is deployed on.  
`SSL_EMAIL` specifies the mail address that is sent to letsencrypt. This address should generally be a group or list address that is independent of a single user.  
`ENTRYPOINT_URL` defines the entrypoint url where any requests are proxied to once SSL termination has been completed. Typically this is a frontend service that performs further proxy passes for backend requests.  

The following optional variables can be set in order to configure the SSL proxy:  
`CLIENT_MAX_BODY_SIZE` represents the maximum body size for any incoming request. It is set to a default of `100M`  
`NGINX_TIMEOUT` defines any timeouts for the SSL proxy. It is set to a default of `300` seconds 

Additional configuration, such as proxy passes, locations, etc. should generally be configured on the `ENTRYPOINT_URL` service 

3. Run `docker-compose up --build`.

Note: The SSL service can be disabled by setting `SSL_ENABLED` to `False`, in which case the `ssl-service` acts as a pure proxy.

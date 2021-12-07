FROM certbot/certbot

RUN apk update && apk add bash
SHELL ["/bin/bash", "-c"]

COPY run_certbot.sh .

ENTRYPOINT bash run_certbot.sh
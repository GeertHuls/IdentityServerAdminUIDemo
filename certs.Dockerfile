FROM alpine:latest

VOLUME /certs

RUN apk add --no-cache openssl

RUN echo "#!/usr/bin/env sh" > createCert.sh && \
    echo openssl req -x509 -nodes -days 3650 -newkey \
            rsa:2048 -keyout /certs/localhost.key \
            -out /certs/localhost.crt -passin pass:Password123! \
            -subj '/CN=localhost' -addext "subjectAltName=DNS:localhost,DNS:ids,DNS:api" >> createCert.sh

RUN chmod +x createCert.sh

ENTRYPOINT [ "/createCert.sh" ]
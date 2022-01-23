#!/usr/bin/env pwsh

if (!(Test-Path $pwd/certs/localhost.crt) -and !(Test-Path $pwd/certs/localhost.key)) {
    docker build -t certs -f certs.Dockerfile .
    docker run -v $pwd/certs:/certs certs
}

docker-compose up --build
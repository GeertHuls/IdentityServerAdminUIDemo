#!/usr/bin/env sh
# -*- coding: utf-8 -*-

if [ ! -f $(pwd)/certs/localhost.crt ] && [ ! -f $(pwd)/certs/localhost.key ]; then
    docker build -t certs -f certs.Dockerfile .
    docker run -v $(pwd)/certs:/certs certs
fi

docker-compose up --build
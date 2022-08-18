#!/usr/bin/bash

# Make localhost certificates

CURRENT_DIRECTORY=$(dirname $(realpath "$0"))

openssl req -x509 \
    -out ${CURRENT_DIRECTORY}/ssl/localhost.crt \
    -keyout ${CURRENT_DIRECTORY}/ssl/localhost.key \
    -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=localhost' -extensions v3_req \
    -config ${CURRENT_DIRECTORY}/ssl/source.cnf

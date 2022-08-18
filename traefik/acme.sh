#!/usr/bin/bash

# Create acme.json and set permissions to 0600

CURRENT_DIRECTORY=$(dirname $(realpath "$0"))

if [ ! -f $CURRENT_DIRECTORY/acme.json ]; then 
    echo 'creating acme.json and set permissions to 0600' \
    && touch $CURRENT_DIRECTORY/acme.json \
    && chmod 0600 $CURRENT_DIRECTORY/acme.json;
fi

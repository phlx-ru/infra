#!/usr/bin/bash

# Extracts secrets from .env ans writes to files

CURRENT_DIRECTORY=$(dirname "$(realpath "$0")")
DOTENV=.env

cat ${CURRENT_DIRECTORY}/${DOTENV} | grep REGISTRY_AUTH | cut -d "=" -f 2 > ${CURRENT_DIRECTORY}/registry/auth/auth

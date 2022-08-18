#!/usr/bin/bash

# Prints parsed arguments from .env file

CURRENT_DIRECTORY=$(dirname "$(realpath "$0")")
DOTENV=.env

echo "$(cat ${CURRENT_DIRECTORY}/${DOTENV} | sed '/^[[:blank:]]*#/d;s/#.*//' | xargs)"

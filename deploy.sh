#!/usr/bin/bash

# Deploy to Docker Swarm stack from docker-compose.swarm.yml file

CURRENT_DIRECTORY=$(dirname "$(realpath "$0")")
CLUSTER=swarm
CONFIG_FILE=docker-compose.swarm.yml
DOTENV=.env

for service in "$@"
do
  env \
    $(cat ${CURRENT_DIRECTORY}/${DOTENV} | sed '/^[[:blank:]]*#/d;s/#.*//' | xargs) \
    docker stack deploy \
    --orchestrator swarm \
    --with-registry-auth \
    -c "${CURRENT_DIRECTORY}"/"${service}"/${CONFIG_FILE} \
    ${CLUSTER}
done

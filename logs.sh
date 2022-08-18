#!/usr/bin/bash

# Prints logs for every passed in arguments service name

CLUSTER=swarm

for service in "$@"
do
  docker logs "$(docker ps -q -f name=${CLUSTER}_${service})"
done

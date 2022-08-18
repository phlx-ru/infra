#!/usr/bin/bash

# Returns container IDs by passed by arguments service names

CLUSTER=swarm

for service in "$@"
do
  docker ps -q -f name=${CLUSTER}_${service}
done

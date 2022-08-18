#!/usr/bin/bash

# Remove services from Docker Swarm node stack by service name

CLUSTER=swarm

for service in "$@"
do
  docker service rm ${CLUSTER}_${service}
done

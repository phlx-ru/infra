#!/usr/bin/bash

# Executes command to container by service name

CLUSTER=swarm

docker exec $(docker ps -q -f name=${CLUSTER}_$1) ${@:2:255}

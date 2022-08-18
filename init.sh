#!/usr/bin/bash

# Init Swarm Cluster if it not exists

if ! docker node ls -q >& /dev/null; then
    echo 'Init Docker Swarm: ' \
    && docker swarm init > swarm.secret \
    && docker node update --label-add cluster=swarm "$(docker node ls -q)";
fi

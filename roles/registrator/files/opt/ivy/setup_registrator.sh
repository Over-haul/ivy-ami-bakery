#!/bin/bash

if [ -f /root/registrator.tar ]; then
    docker load < /root/registrator.tar
fi

docker rm -f registrator
docker run \
    --name=registrator \
    -d \
    --restart always \
    --net=host \
    -v /var/run/docker.sock:/tmp/docker.sock \
    gliderlabs/registrator:v6 -resync 300 consul://localhost:8500

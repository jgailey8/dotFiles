#!/bin/sh

# remove all containers
echo "removing all containers"
docker rm -vf $(docker ps -a -q)

# remove all images
echo "removing all images"
docker rmi -f $(docker images -a -q)

# docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes

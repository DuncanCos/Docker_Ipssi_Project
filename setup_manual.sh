#!/bin/bash

# Create networks and volume
docker network create -d bridge db_network
docker network create -d bridge site_network
docker volume create db_volume

# Build images
docker build -t mysql ./mysql
docker build -t app ./app
docker build -t nginx ./nginx  # only if using custom Dockerfile

# Run containers
docker run -d \
  --name mysql_container \
  --network db_network \
  --network-alias mysql \
  -v db_volume:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=example \
  mysql

docker run -d \
  --name app_container \
  --network db_network \
  --network site_network \
  app

docker run -d \
  --name nginx_container \
  --network site_network \
  -p 5423:824 \
  -v $(pwd)/nginx/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx

# Cleanup (commented out)
# docker stop mysql_container app_container nginx_container
# docker rm mysql_container app_container nginx_container
# docker network rm db_network site_network
# docker volume rm db_volume

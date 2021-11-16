#!/usr/bin/env bash
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"

echo "$SCRIPT:v$VERSION "

# network
echo "creating docker network kmom05_net"
docker network create kmom05_net

# server

echo "starting kmom05_server in background"
docker run --rm --net kmom05_net --name kmom05_server -p 1337:1337 -d neskoc/vlinux-mazeserver:latest

# client

echo "starting kmom05_client in interactive mode"
docker run --rm --net kmom05_net --name kmom05_client --link kmom05_server:server -it neskoc/vlinux-mazeclient:latest /bin/bash

# clean up

echo "stopping kmom05_server"
docker stop kmom05_server

## remove network

echo "removing kmom05_net"
docker network rm kmom05_net

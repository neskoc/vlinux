#!/usr/bin/env bash
#

# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="1.0.0"

echo "$SCRIPT:v$VERSION "

# network
echo "creating docker network kmom06_net"
docker network create kmom06_net

# server

echo "starting kmom06_server in background"
docker run --rm --net kmom06_net --name kmom06_server -p 1337:1337 -d neskoc/vlinux-mazeserver:latest

# client

echo "starting kmom06_client in interactive mode"
docker run --rm --net kmom06_net --name kmom06_client --link kmom06_server:server -it neskoc/vlinux-mazeclient:loop /bin/bash

# clean up

echo "stopping kmom06_server"
docker stop kmom06_server

## remove network

echo "removing kmom06_net"
docker network rm kmom06_net

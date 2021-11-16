FROM debian:stretch-slim

RUN apt-get update && \
	apt-get install -y curl sed gawk jq

WORKDIR client

COPY ./client/ .

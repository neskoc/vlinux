FROM debian:stretch-slim

RUN apt-get update && \
	apt-get install -y curl sed gawk

WORKDIR client

COPY ./client/ .

RUN chmod +x mazerunner.bash
RUN chmod +x testrun.bash

CMD ["/bin/bash", "-c", "./mazerunner.bash loop"]

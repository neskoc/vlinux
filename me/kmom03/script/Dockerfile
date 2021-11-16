FROM debian:stretch-slim

RUN apt update && \
    apt -y install nano \
    cowsay \
    fortune \
    bsdmainutils

WORKDIR kmom03

COPY ./commands.bash /kmom03/

RUN chmod +x /kmom03/commands.bash

CMD ["/bin/bash", "-c", "/kmom03/commands.bash all"]

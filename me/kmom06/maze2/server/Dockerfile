FROM node:latest

WORKDIR server

COPY server/package*.json ./

RUN apt update

RUN npm install

COPY server/ .

ENTRYPOINT [ "npm" ]
CMD [ "start" ]

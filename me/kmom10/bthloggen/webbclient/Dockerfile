FROM node:latest

WORKDIR webbclient

COPY webbclient/package*.json ./

RUN apt update

RUN npm install

COPY webbclient/ .

ENTRYPOINT [ "npm" ]
CMD [ "start" ]

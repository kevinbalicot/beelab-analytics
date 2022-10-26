FROM alpine:3.16 as analytics

RUN apk add --upgrade vim git nodejs npm bash

RUN cd /home && git clone https://github.com/umami-software/umami.git app

WORKDIR /home/app

RUN npm install -g yarn
RUN yarn install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
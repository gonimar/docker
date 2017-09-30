FROM node:alpine
MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

RUN apk --no-cache add --virtual native-deps python

RUN chown -R node:node /usr/local/lib/node_modules
RUN chown -R node:node /usr/local/bin

USER node

RUN npm install -g @angular/cli --quiet && \
  npm cache clean --force

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app

#COPY package.json /usr/src/app/
#RUN npm install && npm cache clean
#COPY . /usr/src/app

EXPOSE 4200 49152

CMD ["npm", "run", "start"]

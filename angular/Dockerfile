FROM node:alpine
MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

run apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install -g @angular/cli --quiet && \
  npm cache clean && \
  apk del native-deps

RUN git config --global user.name "Sergey Gonimar" && \
    git config --global user.email "sergey.gonimar@gmail.com"

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app

#COPY package.json /usr/src/app/
#RUN npm install && npm cache clean
#COPY . /usr/src/app

EXPOSE 4200 49152

CMD ["npm", "run", "start"]

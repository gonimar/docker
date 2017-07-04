FROM node:latest
MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

RUN npm install -g cordova ionic && \
    npm cache clear --force

RUN git config --global user.name "Sergey Gonimar" && git config --global user.email "sergey.gonimar@gmail.com"

VOLUME ["/myApp"]
WORKDIR /myApp

EXPOSE 8100 35729

CMD ["ionic", "serve"]
FROM alpine:3.6

MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

RUN apk add --no-cache --virtual .build-deps \
    git \
    make \
    gcc \
    musl-dev \
    linux-headers \
    openssl-dev

RUN apk add --no-cache \
    curl

COPY ./patches /mtproxy/patches

RUN git clone --single-branch --depth 1 https://github.com/TelegramMessenger/MTProxy /mtproxy/sources

RUN cd /mtproxy/sources && patch -p0 -i /mtproxy/patches/randr_compat.patch && make -j$(getconf _NPROCESSORS_ONLN)

RUN cp /mtproxy/sources/objs/bin/mtproto-proxy /mtproxy/ && \
    chmod +x /mtproxy/mtproto-proxy && \
    rm -rf /mtproxy/{sources,patches} && \
    apk add --virtual .rundeps libcrypto1.0 && \
    apk del .build-deps

COPY docker-entrypoint.sh /

WORKDIR /mtproxy

VOLUME /data
EXPOSE 2398 443

RUN ls /mtproxy

ENTRYPOINT ["/docker-entrypoint.sh"]
#ENTRYPOINT ["/mtproxy/mtproto-proxy", "--help"]
#ENTRYPOINT ["/mtproxy/mtproto-proxy", "--user", "nobody", "--http-ports", "443", "--mtproto-secret", "${SECRET}", "--proxy-tag", "${TAG}", "--slaves", "${WORKERS}"]
#--user nobody --http-ports 443 --mtproto-secret ${SECRET} --proxy-tag ${TAG} --aes-pwd proxy-secret proxy-multi.conf --slaves ${WORKERS}
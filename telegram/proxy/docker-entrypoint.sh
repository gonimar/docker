#!/bin/sh

REMOTE_CONFIG=/data/proxy-multi.conf
curl -s https://core.telegram.org/getProxyConfig -o ${REMOTE_CONFIG} || {
  echo '[F] Cannot download proxy configuration from Telegram servers.'
  exit 2
}

#exec /mtproxy/mtproto-proxy "$@" --aes-pwd ${REMOTE_SECRET} --user root ${REMOTE_CONFIG} --nat-info "$INTERNAL_IP:$EXTERNAL_IP" ${SECRET_CMD} ${TAG_CMD}
exec /mtproxy/mtproto-proxy --user nobody ${REMOTE_CONFIG} --http-ports 443 --mtproto-secret ${SECRET} --proxy-tag ${TAG} --slaves ${WORKERS}

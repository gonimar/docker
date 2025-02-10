FROM alpine:latest

LABEL org.opencontainers.image.authors="Sergey Gonimar <sergey.gonimar@gmail.com>"

RUN apk add --no-cache \
    git \
    curl \
    bash \
    rsync \
    postgresql-client \
    openssh-client

RUN git config --global user.name "Sergey Gonimar" && git config --global user.email "sergey.gonimar@gmail.com"

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"


VOLUME ["/runtime"]
WORKDIR /runtime

CMD ["bash"]

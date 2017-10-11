FROM ubuntu:latest
MAINTAINER Sergey Gonimar <sergey.gonimar@gmail.com>

RUN apt-get update && \
    apt-get install -y openssh-client git

RUN git config --global user.name "Sergey Gonimar" && git config --global user.email "sergey.gonimar@gmail.com"

VOLUME ["/runtime"]
WORKDIR /runtime

CMD ["bash"]

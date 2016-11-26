FROM ubuntu:14.04.3
MAINTAINER caiying <i@caiying.me>

RUN apt-get update && \
    apt-get -y install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev asciidoc xmlto && \
    apt-get -y install git


RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git

RUN cd shadowsocks-libev && ./configure && make && make install

ENTRYPOINT ["/usr/local/bin/ss-local"]

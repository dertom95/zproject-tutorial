FROM ubuntu:latest
MAINTAINER zprotut Developers <email@hostname.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q --force-yes build-essential git-core libtool autotools-dev autoconf automake pkg-config unzip libkrb5-dev cmake   libzmq3-dev

RUN useradd -d /home/zmq -m -s /bin/bash zmq
RUN echo "zmq ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /tmp
RUN git clone --quiet https://github.com/zeromq/czmq.git czmq
WORKDIR /tmp/czmq
RUN ./autogen.sh 2> /dev/null
RUN ./configure --quiet --without-docs
RUN make
RUN make install
RUN ldconfig

WORKDIR /tmp
RUN git clone --quiet https://github.com/dertom95/zproject-tutorial.git zprotut
WORKDIR /tmp/zprotut
RUN ./autogen.sh 2> /dev/null
RUN ./configure --quiet --without-docs
RUN make
RUN make install
RUN ldconfig


USER zmq

FROM ubuntu:22.04 as baseimage2204
LABEL maintainer tpfuemp@github

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    automake autotools-dev build-essential dh-autoreconf \
    ca-certificates git \
    libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev libevent-dev \
    libssl-dev libcurl4-openssl-dev libgmp-dev libsodium-dev libz-dev libdb-dev libdb++-dev bsdmainutils curl libsqlite3-dev \
    libtool pkg-config && \
    apt-get install -y --no-install-recommends mc psmisc wget protobuf-compiler libminiupnpc-dev g++ curl cmake bison libevent-dev libboost-dev libxml2-dev python3 flex dumb-init && \
    apt-get clean

FROM baseimage2204 as coinwallet

# Clone the source code.
ARG STRATUM_UPDATEPASS
ARG CURRENT_GITHUB_COMMIT=09b4d1b1fea13815f7a6b890040657a86d68b89b

RUN git clone https://github.com/HorizenOfficial/zen
WORKDIR /zen

# use the specific commit known to work
RUN git checkout $CURRENT_GITHUB_COMMIT

# apply patch if needed
#COPY docker.patch /tmp/
#RUN patch -p1 < /tmp/docker.patch
RUN zcutil/build.sh --disable-tests --legacy-cpu && \
    strip src/zend && cp src/zend /usr/bin && \
    cd / && rm /zen -rf && \
    rm ~/.cache -rf && rm ~/.ccache -rf && rm ~/.cargo -rf

# blocknotify
COPY blocknotify.cpp /tmp/
WORKDIR /tmp
RUN gcc -DSTRATUM_UPDATEPASS=\"$STRATUM_UPDATEPASS\" -o blocknotify blocknotify.cpp && \
    mv blocknotify /usr/bin/ && rm -f /tmp/blocknotify.cpp

ARG walletuserid
ARG walletgroupid
RUN groupadd -g $walletgroupid walletuser && useradd -r -u $walletuserid -g walletuser walletuser
USER walletuser 

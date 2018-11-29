FROM ubuntu:18.10

LABEL maintainer="Joel Luth (joelluth@gmail.com)"
LABEL description="Docker image for Phoronix Test Suite https://phoronix-test-suite.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ARG PTS_VER=8.4.0
ARG PTS_DEB_URL=http://phoronix-test-suite.com/releases/repo/pts.debian/files

RUN apt-get update --fix-missing \
        && apt-get install -y --no-install-recommends \
                build-essential \
                php-cli \
                php-gd \
                php-json \
                php-posix \
                php-xml \
                php-zip \
                wget \
        && apt-get -y clean \
        && apt-get -y autoremove \
        && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
        && wget ${PTS_DEB_URL}/phoronix-test-suite_${PTS_VER}_all.deb \
        && dpkg -i phoronix-test-suite_${PTS_VER}_all.deb \
        && rm -f phoronix-test-suite_${PTS_VER}_all.deb

ADD run.sh /run.sh
#ENTRYPOINT bash /run.sh $@
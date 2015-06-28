FROM debian:jessie
MAINTAINER Sean Payne <seantpayne@gmail.com>

ENV BITCOIN_VERSION 0.10.2
ENV BITCOIN_DOWNLOAD_FILENAME bitcoin-$BITCOIN_VERSION-linux64.tar.gz

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/$BITCOIN_DOWNLOAD_FILENAME && \
    wget https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/SHA256SUMS.asc && \
    wget https://bitcoin.org/laanwj.asc && \
    wget https://bitcoin.org/gavinandresen.asc && \
    wget https://bitcoin.org/jgarzik-bitpay.asc && \
    wget https://bitcoin.org/gmaxwell.asc && \
    wget https://bitcoin.org/pieterwuille.asc && \
    gpg --import laanwj.asc && \
    gpg --import gavinandresen.asc && \
    gpg --import jgarzik-bitpay.asc && \
    gpg --import gmaxwell.asc && \
    gpg --import pieterwuille.asc && \
    gpg --verify SHA256SUMS.asc && \
    grep -o "$(sha256sum $BITCOIN_DOWNLOAD_FILENAME)" SHA256SUMS.asc && \
    tar xzvf bitcoin-$BITCOIN_VERSION-linux64.tar.gz
RUN mv -v bitcoin-$BITCOIN_VERSION /bitcoin

FROM alpine:latest
LABEL authors="Fazendaaa"

RUN apk add --no-cache git diffutils gcc libc-dev linux-headers perl \
    ca-certificates wget openssl make libxml2-utils libxslt binutils \
    binutils-dev gmp gmp-dev automake libtool m4 autoconf python3 \
    llvm llvm-dev
# cabal alex happy libicu-dev libtinfo-dev libgmp-dev

RUN git clone --recursive https://gitlab.haskell.org/ghc/ghc.git && \
    cd ghc && \
    ./boot && \
    autoreconf && \
    ./configure --with-system-libffi --without-PACKAGE && \
    make && \
    make install

# install ghcide

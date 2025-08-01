FROM debian:bookworm-20250721-slim
LABEL maintainer="cristian@regolo.cc"

ENV DEBIAN_FRONTEND noninteractive

COPY install.sh /install.sh
RUN sh /install.sh && rm /install.sh

VOLUME ["/sources"]
WORKDIR /sources

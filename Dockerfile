# syntax = docker/dockerfile:1.4
FROM debian:bullseye-20230109-slim
LABEL maintainer="cristian@regolo.cc"
LABEL contributor="christian@qnib.org"
## Use caching for /var/lib/apt/lists/ /var/cache/apt/ so that they 
## do not end up in the final image and are cached between builds
#### Setting up apt to keep the downloaded packages
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt <<eot bash
  apt-get update
  apt-cache depends texlive-full \
  | grep "Depends:" \
  | grep -v "doc$" \
  | egrep -v "texlive-(games|music)" \
  | egrep -v "texlive-lang-(arabic|cjk|chinese|cyrillic|czechslovak|european|french|german|greek|italian|japanese|korean|other|polish|portuguese|spanish)$" \
  | cut -d ' ' -f 4 \
  | xargs apt-get install --no-install-recommends -y
  apt-get autoremove
eot
VOLUME ["/sources"]
WORKDIR /sources

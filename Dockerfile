# syntax = docker/dockerfile:1.4
FROM debian:bullseye-20230109-slim
## Use caching for /var/lib/apt/lists/ /var/cache/apt/ so that they 
## do not end up in the final image and are cached between builds
#### Setting up apt to keep the downloaded packages
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt <<eot bash
  apt-get update
  apt-cache depends texlive-full \
  | grep "Depends:" \
  | grep -v "doc$" \
  | cut -d ' ' -f 4 \
  | xargs apt-get install --no-install-recommends -y
  apt-get autoremove
eot

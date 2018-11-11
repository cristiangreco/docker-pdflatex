#!/bin/sh

set -ex

apt-get update

apt-cache depends texlive-full \
  | grep "Depends:" \
  | grep -v "doc$" \
  | cut -d ' ' -f 4 \
  | xargs apt-get install --no-install-recommends -y

apt-get autoclean
apt-get autoremove

rm -rf /var/lib/apt/lists/* /var/cache/apt/*

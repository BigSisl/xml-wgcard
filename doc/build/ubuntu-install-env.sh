#!/bin/bash

d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install environment
apt-get update
apt-get install -y \
    wget \
    texlive-xetex

# install pandoc
wget https://github.com/jgm/pandoc/releases/download/2.7.1/pandoc-2.7.1-1-amd64.deb \
  -O /tmp/pandoc-2.7.1-1-amd64.deb
dpkg -i /tmp/pandoc-2.7.1-1-amd64.deb

$d/compile-factsheet.sh



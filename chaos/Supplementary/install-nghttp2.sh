#!/bin/bash

echo -----
echo "Installing nghttp2..."
git clone https://github.com/nghttp2/nghttp2.git
cd nghttp2
git submodule update --init
wait
autoreconf -i
automake
autoconf
./configure
make

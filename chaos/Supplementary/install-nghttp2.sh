#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


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
wait
echo "done!"
echo

#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


#version="1.11.4"
version="1.16.4"

echo -----
echo "Installing go version: ${version} ..."
goenv install ${version}
goenv global ${version}
goenv rehash
goenv versions
wait
echo "done!"
echo

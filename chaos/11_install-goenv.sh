#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


echo -----
echo "Installing goenv ..."
git clone https://github.com/syndbg/goenv.git ~/.goenv
wait
echo "done!"
echo

echo -----
echo "Adding a command to read environment variables to .bashrc ..."
echo "" >> ~/.bashrc
echo "# --- For goenv" >> ~/.bashrc
echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bashrc
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(goenv init -)"' >> ~/.bashrc
echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
wait
echo "done!"
echo

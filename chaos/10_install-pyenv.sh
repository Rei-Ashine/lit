#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


echo -----
echo "Installing pyenv ..."
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
wait
cd ~/.pyenv && src/configure && make -C src
wait
echo "done!"
echo

echo -----
echo "Adding a command to read environment variables to .bashrc ..."
echo "" >> ~/.bashrc
echo "# --- For pyenv" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
wait
echo "done!"
echo

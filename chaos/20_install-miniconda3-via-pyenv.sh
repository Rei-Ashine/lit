#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


version="miniconda3-4.7.12"

echo -----
echo "Installing ${version} ..."
pyenv install ${version} 
pyenv global ${version}
pyenv rehash
pyenv versions
wait
echo "done!"
echo

echo -----
echo "Setting up conda libraries ..."
conda update conda 
conda config --append channels conda-forge
conda install vim tmux git curl
conda install pandas numpy matplotlib seaborn scikit-learn httplib2 libnghttp2 crcmod
wait
echo "done!"
echo

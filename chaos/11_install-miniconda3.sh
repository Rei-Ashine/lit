#!/bin/bash

version="miniconda3-4.7.12"

echo -----
echo "Installing ${version} ..."
pyenv install ${version} 
pyenv global ${version}
pyenv rehash
pyenv versions
wait

#echo -----
#echo "Adding a command to read environment variables to .bash_profile..."
#echo 'export PATH="$PYENV_ROOT/versions/miniconda3-4.7.12/bin/:$PATH"' >> ~/.bash_profile
#wait

echo -----
echo "Installing libraries..."
conda update conda 
conda config --append channels conda-forge
conda install vim tmux git curl libnghttp2
conda install pandas numpy matplotlib seaborn httplib2 crcmod scikit-learn

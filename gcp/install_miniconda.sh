#!/bin/bash

# Download Miniconda3-4.3.14
echo 'Downloading Miniconda3-4.3.14...'
wget https://repo.anaconda.com/miniconda/Miniconda3-4.3.14-Linux-x86_64.sh
wait
echo 'done!'

# Install Miniconda3-4.3.14
echo 'Installing Miniconda3-4.3.14...'
bash Miniconda3-4.3.14-Linux-x86_64.sh
wait
source .bashrc
wait
echo 'done!'

# Install libraries
echo 'Installing libraries...'
conda update conda
conda config --append channels conda-forge
conda install pandas numpy matplotlib seaborn httplib2 crcmod scikit-learn
wait
echo 'done!'

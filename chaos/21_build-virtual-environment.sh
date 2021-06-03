#!/usr/bin/bash
#$ -S /usr/bin/bash

set -euo pipefail

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


echo -----
echo "Building a virtual environment by conda ..."
conda env create -f environment.yml
wait
echo "done!"
echo

echo -----
echo "Initializing shell ..."
conda init bash
wait
echo "done!"
echo

echo -----
echo "Adding a command to read environment variables to .bashrc ..."
echo "" >> ~/.bashrc
echo "# --- For tmux" >> ~/.bashrc
echo 'if [ -n $TMUX ]; then' >> ~/.bashrc
echo '		conda deactivate' >> ~/.bashrc
echo '		conda activate base' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
wait
echo "done!"
echo

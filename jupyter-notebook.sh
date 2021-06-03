#!/usr/bin/bash
#$ -S /usr/bin/bash
# bash jnote.sh

echo
date
echo "========== Executing $(basename $0) =========="
cd $(dirname $0)


jupyter notebook

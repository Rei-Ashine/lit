#!/usr/bin/bash
#$ -S /usr/bin/bash
# bash jnote.sh

date
echo "Executing $(basename $0)"
echo ==================================================
cd $(dirname $0)

jupyter notebook

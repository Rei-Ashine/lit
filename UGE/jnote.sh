#!/usr/bin/bash
#$ -S /usr/bin/bash
#$ -cwd
#$ -N Jnote
#$ -o dev/null
#$ -e dev/null
#$ -l s_vmem=64G
#$ -l mem_req=64G
# qsub jnote.sh

echo JOB_ID: $JOB_ID
echo JOB_NAME: $JOB_NAME

bash ../jnote.sh

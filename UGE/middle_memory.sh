#!/usr/bin/bash
#$ -S /usr/bin/bash
#$ -cwd
#$ -N Middle
#$ -o /dev/null
#$ -e /dev/null
#$ -l s_vmem=64G
#$ -l mem_req=64G
# qsub middle_memory.sh

echo JOB_ID: $JOB_ID
echo JOB_NAME: $JOB_NAME

bash ../jupyter-notebook.sh

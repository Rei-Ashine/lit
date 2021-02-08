#!/usr/bin/bash
#$ -S /usr/bin/bash
#$ -cwd
#$ -N Test_Pickler
#$ -o archives/Test_Pickler.log
#$ -e archives/Test_Pickler.log
#$ -l s_vmem=32G
#$ -l mem_req=32G
# qsub test_pickler.sh

echo JOB_ID: $JOB_ID
echo JOB_NAME: $JOB_NAME

bash ../test_pickler.sh

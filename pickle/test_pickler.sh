#!/usr/bin/bash
#$ -S /usr/bin/bash
# bash test_pickler.sh

date
echo "Executing $(basename $0)"
echo ==================================================
cd $(dirname $0)
echo "[start]"
path="$(pwd)/data/raw"
ref="$(pwd)/data/processed/VCF"
mkdir -p data/processed/VCF/hg19


START=$(date +%s)
echo "Converting Allele Frequency data to the .pkl files..."
python3 ./scripts/revised_pickler.py -i  ${path}/gnomAD/v2/hg19/gnomad.exomes.r2.1.1.sites.1.vcf.bgz -s hg19 -r ${ref}/Columns_gnomAD.txt
wait


END=$(date +%s)
echo "[end]"
echo ==================================================
date
PT=$(expr ${END} - ${START})
H=$(expr ${PT} / 3600)
PT=$(expr ${PT} % 3600)
M=$(expr ${PT} / 60)
S=$(expr ${PT} % 60)
echo "Execution time: ${H}:${M}:${S}"

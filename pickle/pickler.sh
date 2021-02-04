#!/usr/bin/bash
#$ -S /usr/bin/bash
# bash pickler.sh

date
echo "Executing $(basename $0)"
echo ==================================================
cd $(dirname $0)
echo "[start]"
path="$(pwd)/data/raw"
ref="$(pwd)/data/processed"
mkdir -p data/processed/VCF/hg19


START=$(date +%s)
echo "Converting Allele Frequency data to the .pkl files..."
echo "~~~~~ gnomAD ~~~~~"
echo ----------
python3 ./scripts/pickler.py -i  ${path}/gnomAD/v2/hg19/gnomad.exomes.r2.1.1.sites.vcf.bgz -s hg19 -r ${ref}/VCF/Columns_gnomAD.txt
wait
echo ----------


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

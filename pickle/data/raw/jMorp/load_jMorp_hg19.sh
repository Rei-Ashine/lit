#!/usr/bin/bash
#$ -S /usr/bin/bash

function abort
{
    echo "$@" 1>&2
    exit 1
}

cd $(dirname $0)
echo "Executing $(basename $0)"
[ -f "./hg19/tommo-8.3kjpn-20200831-af_snvall-autosome.vcf.gz" ] && abort "jMorp data [hg19] already exists."
mkdir -p hg19
cd hg19

# jMorp
# Genome Variation/v20200831/Allele frequency (SNV; Autosome)
URL="https://jmorp.megabank.tohoku.ac.jp/dj1/datasets/tommo-8.3kjpn-20200831-af_snvindelall/files/tommo-8.3kjpn-20200831-af_snvall-autosome.vcf.gz?download=true"

echo "Loading jMorp input file [hg19]..."
echo "Get data from : ${URL}"
wget -q ${URL}
status=$?
if [ ${status} -ne 0 ]; then
    abort "[Error] Wget exit status: ${status}"
fi
# Rename vcf file
mv tommo-8.3kjpn-20200831-af_snvall-autosome.vcf.gz?download=true tommo-8.3kjpn-20200831-af_snvall-autosome.vcf.gz
wait

echo "done!"

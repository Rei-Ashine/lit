#!/usr/bin/bash
#$ -S /usr/bin/bash

function abort
{
    echo "$@" 1>&2
    exit 1
}

cd $(dirname $0)
echo "Executing $(basename $0)"
[ -f "./v2/hg19/gnomad.exomes.r2.1.1.sites.1.vcf.bgz" ] && abort "gnomAD test data [hg19] already exists."
mkdir -p v2/hg19
cd v2/hg19

# gnomAD v2
# Variants/Exomes/chr1 sites VCF
URL="https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.1.vcf.bgz"

echo "Loading gnomAD input test file [hg19]..."
echo "Get data from : ${URL}"
wget -q ${URL}
status=$?
if [ ${status} -ne 0 ]; then
    abort "[Error] Wget exit status: ${status}"
fi
wait

echo "done!"

#!/usr/bin/bash
#$ -S /usr/bin/bash

function abort
{
    echo "$@" 1>&2
    exit 1
}

cd $(dirname $0)
echo "Executing $(basename $0)"
[ -f "./v2/hg19/gnomad.exomes.r2.1.1.sites.vcf.bgz" ] && abort "gnomAD data [hg19] already exists."
mkdir -p v2/hg19
cd v2/hg19

# gnomAD v2
# Variants/Exomes/All chromosomes sites VCF
#URL="https://storage.googleapis.com/gnomad-public/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz"
URL="https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz"
# README.txt
url="https://storage.googleapis.com/gnomad-public/release/2.1.1/README.txt"

echo "Loading gnomAD input file [hg19]..."
echo "Get data from : ${URL}"
wget -q ${URL} 
echo "Get README.txt from : ${url}"
wget -q ${url}
wait

echo "done!"

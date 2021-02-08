# DATE: Feb. 8th, 2021
# Author: rei-ashine 
# Script for MGeND Analysis
# Pickling VCF file
import argparse
import csv
import itertools
import os
import os.path

import joblib
from cyvcf2 import VCF
import gzip
import re


def format_str(x):
    if x is None:
        y = ''
    else:
        if isinstance(x, list):
            if not x:
                y = ';'.join(x)
            else:
                y = ''
        else:
            y = str(x)
    return y


def info(record, target, i, out):
    x = record.INFO.get(target)
    if isinstance(x, list):
        check_num = len(x) - 1
        if check_num == i:
            r = x[i]
            out.append(r)
        else:
            i = check_num - 1
            r = x[i]
            out.append(r)
    else:
        out.append(x)
    return out


def picker(variant, vcf_columns):
    df = []
    # vcf_template_col_list
    chrom = variant.CHROM
    pos = variant.POS
    variant_id = variant.ID
    ref = variant.REF
    alt = variant.ALT
    num = len(alt)
    for i in range(num):
        a = alt[i]
        new_record = [chrom, pos, variant_id, ref, a]
        new_record = list(map(format_str, new_record))
        # vcf_additional_col_list
        col = vcf_columns[5:]
        new_record = [info(variant, str(c), i, new_record) for c in col]
        df.append(new_record)
    df = [flatten for inner in df for flatten in inner]
    return df


def parse_vcf(vcf_file, vcf_columns, vcf_version):
    # For jMorp (allows UTF-8) or gnomAD (ASCII only)
    if vcf_version == "VCFv4.3" or vcf_version == "VCFv4.2":
        df = [picker(variant, vcf_columns) for variant in VCF(vcf_file)]
        df = [flatten for inner in df for flatten in inner]
        df = list(map(list, set(map(tuple, df))))
    else:
        raise Exception("[Error] {} is not verified!".format(version))
    return df


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', required=True, help='set input vcf file')
    parser.add_argument('-s', '--seq', required=True, help='specify reference sequence version')
    parser.add_argument('-r', '--ref', required=True, help='set vcf column list for extraction')
    parser.add_argument('-o', '--output', default='data/processed/VCF',
                        help='set output directory name')
    args = parser.parse_args()

    # --- Load data file
    # VCF data source
    dbname = os.path.basename(args.ref)
    dbname = re.findall("Columns_(.*).txt", dbname)
    print("~~~~~ {0} [{1}] ~~~~~".format(dbname[0], args.seq))

    # Input VCF data
    path_input = args.input
    basename = os.path.basename(path_input)
    print("Input vcf file name : {}".format(os.path.basename(path_input)))
    with gzip.open(path_input, 'rb') as f:
        line = f.readline()
        line = line.decode().strip()
        vcf_version = line.lstrip("##fileformat=")
        print("--> VCF version: {}".format(vcf_version))

    # VCF column list for extraction
    path_ref = args.ref
    with open(path_ref, newline="") as f:
        reader = csv.reader(f, delimiter="\t")
        column_list = list(reader)
    vcf_additional_col_list = list(itertools.chain.from_iterable(column_list))
    print("Additional vcf column list file name : {}".format(os.path.basename(path_ref)))

    # --- Parse VCF file
    print("Parsing vcf file...")
    vcf_template_col_list = ['CHROM', 'POS', 'ID', 'REF', 'ALT']
    vcf_columns = vcf_template_col_list + vcf_additional_col_list
    vcf = parse_vcf(path_input, vcf_columns, vcf_version)

    # --- Convert to DataFrame
    # import pandas as pd
    # vcf = pd.DataFrame(vcf)
    # vcf.columns = vcf_columns
    # vcf.head()

    # --- Export file
    # Pickle file
    print("Pickling parsed vcf file...")
    pickled_path = "{0}/{1}/{2}.pkl".format(args.output, args.seq, os.path.splitext(basename)[0])
    joblib.dump(vcf, pickled_path)


if __name__ == '__main__':
    print("----------")
    main()
    print("done!")
    print("----------")

#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/hmp2mgs_metaphlan4_1_%j.out
#SBATCH -c 8

reads_path=/home6/hlberman/VMMG/bbmap_human/hmp2mgs_filt_fastq/
out_path=/home6/hlberman/VMMG/metaphlan4/outputs/hmp2mgs_metaphlan/

# List SRA accessions
declare -a arr=(
SRR6744532
SRR6744168
SRR6744746
SRR6745273
SRR6743999
SRR6744153
SRR6744235
SRR6744764
SRR6744130
SRR6745283
SRR6744772
SRR6744670
SRR6744903
SRR6744041
SRR6744036
SRR6744201
SRR6744439
SRR6745258
SRR6744132
SRR6744817
SRR6745274
SRR6744182
SRR6745244
SRR6745061
SRR6744221
SRR6743969
SRR6743989
SRR6745246
SRR6745136
SRR6745027
SRR6745215
SRR6744285
SRR6745038
SRR6744797
SRR6744294
SRR6745150
SRR6744312
SRR6744301
SRR6745123
SRR6743937
SRR6744020
SRR6745175
SRR6744762
SRR6744580
SRR6745074
SRR6744234
SRR6745057
SRR6745023
SRR6744140
SRR6745037
SRR6744150
SRR6744566
SRR6744178
SRR6744050
SRR6744330
SRR6743986
SRR6745111
SRR6745255
SRR6745145
SRR6745267
SRR6745263
SRR6744377
SRR6743962
SRR6744952
SRR6744160
SRR6744738
SRR6744037
SRR6744683
SRR6745178
SRR6744626
SRR6744300
SRR6744990
SRR6743985
SRR6745266
SRR6745103
SRR6744243
SRR6744102
SRR6743941
SRR6745162
SRR6744496
SRR6745251
SRR6744226
SRR6745095
SRR6744241
SRR6744447
SRR6744019
SRR6745033
SRR6744321
SRR6744854
SRR6744263
SRR6744587
SRR6744994
SRR6744987
)


for accession in "${arr[@]}"
do
metaphlan \
    $reads_path/${accession}_1.fastq.gz,$reads_path/${accession}_2.fastq.gz \
    --input_type fastq \
    --nproc 8 \
    --index mpa_vOct22_CHOCOPhlAnSGB_202212 \
    --bowtie2db /home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/metaphlan_databases/ \
    --bowtie2out $out_path/${accession}_metaphlan2_bowtie2.bz2  \
    -o $out_path/${accession}_metaphlan_bugs_list.tsv
done

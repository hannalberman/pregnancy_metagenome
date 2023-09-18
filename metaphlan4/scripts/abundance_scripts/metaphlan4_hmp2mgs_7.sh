#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/hmp2mgs_metaphlan4_7_%j.out
#SBATCH -c 8

reads_path=/home6/hlberman/VMMG/bbmap_human/hmp2mgs_filt_fastq/
out_path=/home6/hlberman/VMMG/metaphlan4/outputs/hmp2mgs_metaphlan/

# List SRA accessions
declare -a arr=(
SRR6744348
SRR6744605
SRR6744654
SRR6744245
SRR6744807
SRR6744728
SRR6744106
SRR6743913
SRR6744386
SRR6744341
SRR6743917
SRR6744451
SRR6744953
SRR6744648
SRR6744942
SRR6744061
SRR6744801
SRR6744085
SRR6744644
SRR6743921
SRR6744816
SRR6744034
SRR6743953
SRR6744905
SRR6744643
SRR6744652
SRR6744076
SRR6744190
SRR6744396
SRR6744771
SRR6744275
SRR6744924
SRR6744399
SRR6743915
SRR6744887
SRR6744286
SRR6744719
SRR6744524
SRR6744039
SRR6744223
SRR6744007
SRR6744657
SRR6744774
SRR6744727
SRR6744732
SRR6744752
SRR6744568
SRR6743931
SRR6744475
SRR6744820
SRR6744549
SRR6744617
SRR6744268
SRR6744579
SRR6744424
SRR6744520
SRR6744491
SRR6744354
SRR6744769
SRR6743929
SRR6744287
SRR6743948
SRR6744351
SRR6744853
SRR6744158
SRR6744694
SRR6744543
SRR6744512
SRR6744715
SRR6744531
SRR6744624
SRR6743939
SRR6744145
SRR6744033
SRR6744700
SRR6744686
SRR6744433
SRR6744802
SRR6744514
SRR6744236
SRR6744457
SRR6744216
SRR6744359
SRR6744355
SRR6744823
SRR6744559
SRR6744044
SRR6744271
SRR6743945
SRR6743952
SRR6744006
SRR6744213
SRR6744128
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

#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/hmp2mgs_metaphlan4_6_%j.out
#SBATCH -c 8

reads_path=/home6/hlberman/VMMG/bbmap_human/hmp2mgs_filt_fastq/
out_path=/home6/hlberman/VMMG/metaphlan4/outputs/hmp2mgs_metaphlan/

# List SRA accessions
declare -a arr=(
SRR6744077
SRR6745151
SRR6744498
SRR6744668
SRR6745075
SRR6745051
SRR6745198
SRR6744814
SRR6744003
SRR6743976
SRR6745019
SRR6743934
SRR6745013
SRR6744631
SRR6745082
SRR6745236
SRR6744069
SRR6745170
SRR6744863
SRR6745280
SRR6744392
SRR6744526
SRR6745214
SRR6745148
SRR6744174
SRR6744911
SRR6743914
SRR6745008
SRR6744043
SRR6745240
SRR6744040
SRR6743932
SRR6744256
SRR6744969
SRR6744185
SRR6744698
SRR6745217
SRR6745164
SRR6744748
SRR6743944
SRR6745197
SRR6745234
SRR6745212
SRR6744299
SRR6745070
SRR6745176
SRR6745069
SRR6745091
SRR6745269
SRR6745135
SRR6744008
SRR6743994
SRR6743956
SRR6744939
SRR6744795
SRR6744204
SRR6744217
SRR6744469
SRR6743918
SRR6745160
SRR6744418
SRR6744880
SRR6744131
SRR6745272
SRR6744742
SRR6745188
SRR6745168
SRR6745281
SRR6744292
SRR6744215
SRR6744073
SRR6744515
SRR6744508
SRR6744687
SRR6744227
SRR6744311
SRR6743910
SRR6744027
SRR6744449
SRR6744017
SRR6744922
SRR6744404
SRR6743922
SRR6744138
SRR6744851
SRR6744135
SRR6744118
SRR6744787
SRR6744463
SRR6744345
SRR6744162
SRR6744412
SRR6744788
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
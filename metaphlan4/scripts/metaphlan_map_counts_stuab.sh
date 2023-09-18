#!/bin/bash
#SBATCH -o /home6/hlberman/VMMG/metaphlan4/log/stuab_metaphlan_counts_%j.out
#SBATCH -c 16

in_path=/home6/hlberman/VMMG/metaphlan4/outputs/stuab_metaphlan
out_path=/home6/hlberman/VMMG/metaphlan4/outputs/stuab_marker_counts

# List SRA accessions
declare -a arr=(
# 1000801248
1000801318
1000801368
1001301158
1001301248
1001301318
1001801138
1001801248
1001801318
1002701138
1002701158
1002701278
1003101118
1003101188
1003101278
1004001168
1004001278
1004001348
1005601098
1005601168
1005601348
1050801308
1050801318
1050835178
1050835218
1060435158
1060435318
1060435348
1060801198
1060801338
1060835148
1061235118
1061235188
1061235278
1061635088
1061635208
1061635368
1062101108
1062101238
1062101338
1062301128
1062301198
1062335178
1062601228
1062601258
1062601368
1062701128
1062701298
1062735148
1062735198
1062901138
1062901218
1062901318
1900401198
1900401288
1900401398
1902401118
1902401208
1902401308
2050501168
2050501298
2050501348
4002101198
4002101298
4002135018
4003235018
4003235288
4003235368
4004235208
4004235248
4004235268
4004735328
4004735368
4004935158
4004935268
4004935338
4005935278
4005935328
4005935358
4006635198
4006635258
4006635278
4006635338
4006935208
4006935248
4006935358
4007135108
4007135118
4007135148
4007135288
4007235168
4007235278
4007435168
4007435248
4007435258
4007535198
4007535238
4007535358
4008435348
4008435158
4008435358
4009035168
4009035268
4009035368
4009835178
4009835228
4009835268
)

for accession in "${arr[@]}"
do
#count metaphlan marker reads
metaphlan \
    $in_path/${accession}_metaphlan2_bowtie2.bz2 \
    --input_type bowtie2out \
    --nproc 16 \
    --index mpa_vOct22_CHOCOPhlAnSGB_202212 \
    --bowtie2db /home6/hlberman/Applications/metaphlan4/MetaPhlAn/metaphlan/metaphlan_databases/ \
    -t marker_counts \
    -o $out_path/${accession}_marker_reads.tsv
done

#note metaphlan2 in the bowtie file name is a typo
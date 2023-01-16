#!/bin/bash
#SBATCH -o bowtie_cmds_%j.out

declare -a arr=(1000801248
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
4009835268)

## now loop through the above array
for i in "${arr[@]}"
do
sbatch --exclude=node1,node2,node3,node4,node5,node10,node11,node12,node13,node14,node15,node16,node17 /home/hlberman/VMMG/bowtie_human/scripts/bowtie_filter_human.sh $i
done
#!/bin/bash

SAMPLES="SRR6008648_1 SRR6008629_1"


#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools view -@ 3 -bS  /data/${sample}.sam  -o /data/${sample}.bam

#done


#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools sort -@ 3 /data/${sample}.bam  -o /data/${sample}_sorted.bam

#done

#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools sort -@ 3 /data/${sample}.bam  -o /data/${sample}_sorted.bam

#done


#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools index -@ 3 /data/${sample}_sorted.bam

#done

#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools idxstats -@ 3 /data/${sample}_sorted.bam > ${sample}_idxstats.txt

#done

#mv *.txt bowtie2_output

#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools stats -@ 3 /data/${sample}_sorted.bam > ${sample}_stats.txt

#done

#mv *.txt bowtie2_output

for sample in ${SAMPLES}; do
    docker run --platform linux/amd64 -it --rm -v $(pwd)/bowtie2_output:/data staphb/samtools:1.13 samtools flagstat -@ 3 /data/${sample}_sorted.bam > ${sample}_flagstat.txt

done

mv *.txt bowtie2_output
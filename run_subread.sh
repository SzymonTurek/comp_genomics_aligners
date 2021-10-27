#!/bin/bash
#script to align sequences to Drosphila Melanogaster genome with subread.
SAMPLE1=(SRR6008648_1 SRR6008629_1)
SAMPLE2=(SRR6008648_2 SRR6008629_2)


mkdir trimmomatic_output


for i in "${!SAMPLE1[@]}"; do
    docker run --platform linux/amd64 -it --rm -v $(pwd):/data staphb/trimmomatic:0.39 trimmomatic PE /data/"${SAMPLE1[i]}".fastq.gz /data/"${SAMPLE2[i]}".fastq.gz /data/"${SAMPLE1[i]}".trim.fastq.gz /data/"${SAMPLE1[i]}"un.trim.fastq.gz /data/"${SAMPLE2[i]}".trim.fastq.gz /data/"${SAMPLE2[i]}"un.trim.fastq.gz ILLUMINACLIP:/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:40:15
done

#mv "${SAMPLE1[i]}".trim.fastq.gz "${SAMPLE1[i]}"un.trim.fastq.gz "${SAMPLE2[i]}".trim.fastq.gz "${SAMPLE2[i]}"un.trim.fastq.gz trimmomatic_output/
mv *.trim.fastq.gz *un.trim.fastq.gz trimmomatic_output/


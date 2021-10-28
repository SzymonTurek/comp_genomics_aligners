#!/bin/bash
#script to align sequences to Drosphila Melanogaster genome with Bowtie2.
SAMPLE1=(SRR6008648_1 SRR6008629_1)
SAMPLE2=(SRR6008648_2 SRR6008629_2)

#mkdir hisat2_output
#mkdir drosophila_hisat2_index

#docker run --platform linux/amd64 -it --rm -v $(pwd):/data makaho/hisat2-zstd hisat2-build -p 3 /data/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna /data/drosophila_hisat2_index/hisat2_index

for i in "${!SAMPLE1[@]}"; do
    mv bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq.gz bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq
    mv bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq.gz bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq
done


for i in "${!SAMPLE1[@]}"; do
     docker run --platform linux/amd64 -it --rm -v $(pwd):/data makaho/hisat2-zstd hisat2 -p 3 -x /data/drosophila_hisat2_index/hisat2_index -1 /data/bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq -2 /data/bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq -S /data/hisat2_output/"${SAMPLE1[i]}".sam
done

for i in "${!SAMPLE1[@]}"; do
    mv bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq.gz
    mv bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq.gz
done

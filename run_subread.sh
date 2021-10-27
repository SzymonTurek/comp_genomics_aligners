#!/bin/bash
#script to align sequences to Drosphila Melanogaster genome with subread.
SAMPLE1=(SRR6008648_1 SRR6008629_1)
SAMPLE2=(SRR6008648_2 SRR6008629_2)


mkdir subread_output
mkdir drosophila_subread_index

docker run --platform linux/amd64 -it --rm -v $(pwd):/data nanozoo/subread:2.0.2--53f5da6 subread-buildindex -o /data/drosophila_index /data/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna

mv drosophila_index.00.b.array drosophila_index.00.b.tab drosophila_index.files drosophila_index.log drosophila_index.reads ./drosophila_subread_index


for i in "${!SAMPLE1[@]}"; do
    docker run --platform linux/amd64 -it --rm -v $(pwd):/data nanozoo/subread:2.0.2--53f5da6 subread-align -T 3 -t 1 -d 50 -D 600 -i /data/drosophila_subread_index/drosophila_index -r /data/bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq.gz -R /data/bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq.gz -o /data/subread_"${SAMPLE1[i]}"_PE.bam
done

mv *.bam *.vcf subread_output/


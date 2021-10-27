#!/bin/bash
#script to align sequences to Drosphila Melanogaster genome with Bowtie2.
SAMPLE1=(SRR6008648_1 SRR6008629_1)
SAMPLE2=(SRR6008648_2 SRR6008629_2)

#mkdir bowtie2_output
#mkdir drosophila_bowtie_index

#docker run --platform linux/amd64 -it --rm -v $(pwd):/data alexeyebi/bowtie2_samtools bowtie2-build /data/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna /data/drosophila_bowtie_index/bowtie_index

#bowtie2 -t -p 12 -x bowtie2/NC_012967.1 -1 SRR030257_1.fastq -2 SRR030257_2.fastq -S bowtie2/SRR030257.sam -p specify number of prcessors

#for i in "${!SAMPLE1[@]}"; do
#    gunzip bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq.gz
#done



#for i in "${!SAMPLE1[@]}"; do
#     docker run --platform linux/amd64 -it --rm -v $(pwd):/data alexeyebi/bowtie2_samtools bowtie2 -t -x /data/drosophila_bowtie_index/bowtie_index -1 /data/bfc_corrected_trimmomatic_"${SAMPLE1[i]}".fastq.gz -2 /data/bfc_corrected_trimmomatic_"${SAMPLE2[i]}".fastq.gz -S /data/bowtie2_output/"${SAMPLE1[i]}".bam
#done


docker run --platform linux/amd64 -it --rm -v $(pwd):/data alexeyebi/bowtie2_samtools bowtie2 -t -x /data/drosophila_bowtie_index/bowtie_index -1 /data/bfc_corrected_trimmomatic_SRR6008629_1.fastq -2 /data/bfc_corrected_trimmomatic_SRR6008629_2.fastq -S /data/bowtie2_output/SRR6008629_1.sam
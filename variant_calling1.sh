#!/bin/bash
#https://wikis.utexas.edu/display/bioiteam/Single+Nucleotide+Variant+%28SNV%29+calling+Tutorial+GVA2021
SAMPLES="SRR6008648_1 SRR6008629_1"
mkdir variant_calling1_out

#docker run --platform linux/amd64 -it --rm -v $(pwd):/data staphb/samtools:1.13 samtools faidx /data/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna



#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd):/data staphb/samtools:1.13 samtools view -@ 3 -bS  /data/bowtie2_output/${sample}.sam  -o /data/variant_calling1_out/${sample}.bam

#done


#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd):/data staphb/samtools:1.13 samtools sort -@ 3 /data/variant_calling1_out/${sample}.bam  -o /data/variant_calling1_out/${sample}_sorted.bam

#done


#for sample in ${SAMPLES}; do
#    docker run --platform linux/amd64 -it --rm -v $(pwd):/data staphb/samtools:1.13 samtools index -@ 3 /data/variant_calling1_out/${sample}_sorted.bam
#done

for sample in ${SAMPLES}; do
    docker run --platform linux/amd64 -it --rm -v $(pwd):/data biocontainers/bcftools:v1.9-1-deb_cv1 bcftools mpileup -O u -f /data/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna /data/variant_calling1_out/${sample}_sorted.bam -o /data/variant_calling1_out/bcftools_${sample}.bcf
done

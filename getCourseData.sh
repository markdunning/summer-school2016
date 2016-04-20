mkdir -p Day2/bam
mkdir -p ref_data


wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz -P ref_data/
gunzip ref_data/bowtie/human_g1k_v37.fasta.gz

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/HG00096/exome_alignment/HG00096.mapped.illumina.mosaik.GBR.exome.20111114.bam 22 | samtools view -bS - > Day2/HG00096.chr22.bam
samtools index Day2/HG00096.chr22.bam
rm HG00096.mapped.illumina.mosaik.GBR.exome.20111114.bam.bai
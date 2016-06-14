mkdir -p data/hapmap
mkdir -p ref_data


wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz -P ref_data/
gunzip ref_data/human_g1k_v37.fasta.gz

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19239/exome_alignment/NA19239.mapped.solid.mosaik.YRI.exome.20111114.bam 22 | samtools view -bS - > data/hapmap/NA19239.chr22.bam
samtools index data/hapmap/NA19239.chr22.bam

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19238/exome_alignment/NA19238.mapped.illumina.mosaik.YRI.exome.20111114.bam 22 | samtools view -bS - > data/hapmap/NA19238.chr22.bam
samtools index data/hapmap/NA19238.chr22.bam

samtools view -h ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA19240/exome_alignment/NA19240.mapped.solid.mosaik.YRI.exome.20111114.bam 22 | samtools view -bS - > data/hapmap/NA19240.chr22.bam
samtools index data/hapmap/NA19240.chr22.bam


wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/other_exome_alignments/NA06984/exome_alignment/NA06984.mapped.illumina.mosaik.CEU.exome.20111114.bam

java -jar $PICARD DownsampleSam I=NA06984.mapped.illumina.mosaik.CEU.exome.20111114.bam O=random.bam P=0.1 VALIDATION_STRINGENCY=SILENT

rm NA06984.mapped.illumina.mosaik.CEU.exome.20111114.bam

samtools view -f 0x02 -b random.bam > paired.bam 

java -jar $PICARD SamToFastq I=paired.bam F=sample.fq1 VALIDATION_STRINGENCY=SILENT F2=sample.fq2 R1_MAX_BASES=68 R2_MAX_BASES=68


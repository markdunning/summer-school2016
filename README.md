# CRUK Bioinformatics Summer School 2016
## Analysis of Cancer Genomes

# Description

High-throughput technologies such as next generation sequencing (NGS) can routinely produce massive amounts of data. These technologies allow us to describe all variants in a genome and international collaborative efforts such as The Cancer Genome Atlas (TCGA) and International Cancer Genome Consortium (ICGC) have begun to catalogue and release data on genomic variation in a variety of cancer types.

However, such datasets pose new challenges in the way the data have to be analyzed, annotated and interpreted which are not trivial and are daunting to the wet-lab biologist. This course covers state-of-the-art and best-practice tools for the analysis of cancer genomes. We describe the entire workflow of 

# Instructors

- Mark Dunning
- Andy Lynch
- Geoff Macintyre
- Oscar Rueda
- Maria Secrier
- (Ines de Santiago?)

# Aims

- Describe theory behind current methods for calling SNVs and copy-number changes from NGS data, and their limitations
- Encourage exploration of NGS data using interactive tools such the Integrative Genomics Viewer (IGV)
- 

# Objectives

- Interpret set of variant calls
- Explore a dataset independantly
- Know how to access TCGA and ICGC data and what is on offer

# Timetable

## Day One

- Introduction to Sequencing technologies
- Introduction / Recap of R
- Quality assessment of NGS data
      - fastqc
      - IGV

## Day Two

- Dealing with NGS data in Bioconductor
    - Genomic Ranges and Biostrings
- Analysis of Exome data
    - Copy-number analysis
  
## Day Three

- Calling SNVs from NGS data
    - Germline / somatic SNPs
    - indels (describing the issues with)
- Interpreting calls
    - Visualising / verifying in IGV
    - Annotating with annovar / Bioconductor
  
## Day Four

- Calling Structural Variants
- Interpreting and visualising calls
    - circos / Bioconductor equivalents
    - downstream analysis
    
## Day Five (1/2 day)

-  Dealing with large collections of Genomes
    - Obtaining TCGA (/ICGC?) data
    - Mutational signatures
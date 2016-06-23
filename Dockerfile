
FROM bioconductor/release_base
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>


RUN apt-get update && apt-get install -y --fix-missing git libqt4-opengl-dev samtools bowtie2 fastx-toolkit tophat python-dev cmake vcftools 
###Get repository of the course. Install data and R packages
RUN git clone https://github.com/markdunning/summer-school2016.git /home/rstudio/
WORKDIR /home/rstudio
#RUN chmod +x getCourseData.sh
#RUN ./getCourseData.sh
#RUN rm -r images javascripts stylesheets params.json index.html
WORKDIR /tmp
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.3.zip -P /tmp
RUN unzip fastqc_v0.11.3.zip
RUN sudo chmod 755 FastQC/fastqc
RUN ln -s $(pwd)/FastQC/fastqc /usr/bin/fastqc
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN sudo python get-pip.py
RUN sudo pip install cython
RUN sudo pip install --user --upgrade cutadapt
RUN rm get-pip.py
RUN sudo apt-get install -y openjdk-7-jdk
RUN wget https://github.com/samtools/htslib/releases/download/1.3.1/htslib-1.3.1.tar.bz2
RUN bzip -d htslib-1.3.1.tar.bz2
RUN tar xvf htslib-1.3.1.tar
WORKDIR htslib-1.3.1
RUN make install
RUN chmod +x ~/.local/bin/cutadapt
RUN ln -s ~/.local/bin/cutadapt /usr/bin/cutadapt
WORKDIR /home/rstudio/
RUN R -f installBioCPkgs.R
WORKDIR /tmp
RUN git clone --recursive git://github.com/ekg/freebayes.git
WORKDIR freebayes
RUN make
RUN sudo make install
WORKDIR /tmp/
RUN git clone git://github.com/genome/somatic-sniper.git
RUN mkdir somatic-sniper/build
WORKDIR somatic-sniper/build
RUN cmake ../
RUN make deps
RUN make -j
RUN make text
RUN make install
RUN apt-get install tabix bedtools build-essential git-core cmake zlib1g-dev libncurses-dev
WORKDIR /tmp
RUN wget http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz
RUN tar xvfz annovar.latest.tar.gz
RUN ln -s /tmp/annovar/annotate_variation.pl /usr/bin
RUN ln -s /tmp/annovar/table_annovar.pl /usr/bin
RUN annotate_variation.pl -buildver hg19 -downdb refGene /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb cytoBand /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb genomicSuperDups /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb -webfrom annovar esp6500siv2_al /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb -webfrom annovar 1000g2014oct /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb -webfrom annovar snp138 /home/rstudio/ref_data/annovar
RUN annotate_variation.pl -buildver hg19 -downdb -webfrom annovar ljb26_all /home/rstudio/ref_data/annovar

WORKDIR /home/rstudio/

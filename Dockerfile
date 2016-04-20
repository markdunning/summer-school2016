
FROM bioconductor/release_base
MAINTAINER Mark Dunning<mark.dunning@cruk.cam.ac.uk>


RUN apt-get update && apt-get install -y git libX11-dev libqt4-opengl-dev samtools bowtie2 fastx-toolkit tophat python-dev cmake
###Get repository of the course. Install data and R packages
RUN git clone https://github.com/bioinformatics-core-shared-training/ndarc16.git /home/rstudio/
WORKDIR /home/rstudio
RUN chmod +x getCourseData.sh
RUN ./getCourseData.sh
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

RUN chmod +x ~/.local/bin/cutadapt
RUN ln -s ~/.local/bin/cutadapt /usr/bin/cutadapt
WORKDIR /home/rstudio/
RUN R -f installBioCPkgs.R

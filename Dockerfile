FROM ubuntu:22.04

# Ensure a consistent shell environment for our tool's execution scripts.
SHELL ["/bin/bash", "-c"]

ARG LOC_AREA=Asia
ARG LOC_CITY=Bangkok
ARG USR=default_user
ENV USER=$USR
# The following settings are required for non-interactive timezone configuration.
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

# Making sure our chosen OS environment is updated and as secure as possible.
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get dist-upgrade -y

# Base tool support.
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3-dev python3-pip git wget seqtk ncbi-blast+ \
  emboss diamond-aligner samtools minimap2 vim-tiny tree \
  make fastqc multiqc bwa bowtie2 tabix vcftools mafft raxml \
  bsdmainutils less trinityrnaseq

# Set local timezone so the timestamps are consistent with when the analysis is run.
RUN echo "tzdata tzdata/Areas select ${LOC_AREA}" | debconf-set-selections && \
    echo "tzdata tzdata/Zones/Asia select ${LOC_CITY}" | debconf-set-selections && \
    apt-get install -qqy --no-install-recommends tzdata

# Set up the image's user account.
RUN mkdir -p /etc/sudoers.d && \
  export uid=1000 gid=1000 && \
  mkdir -p /home/$USER && \
  echo "$USER:x:${uid}:${gid}:$USER,,,:/home/$USER:/bin/bash" >> /etc/passwd && \
  echo "$USER:x:${uid}:" >> /etc/group && \
  echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
  chmod 0440 /etc/sudoers.d/$USER && \
  chown ${uid}:${gid} -R /home/$USER

ENV HOME /home/$USER
WORKDIR $HOME

# Copy our example data into the container. Pass ownership to the user.
RUN mkdir -p $HOME/data
COPY ./data $HOME/data
RUN chown $USER:$USER -R $HOME/data

# Become the user
USER $USER

# Install the NCBI Entrez Utilities (support for efetch)
#   Has problems with Ubuntu 22.04 on Apple Silicon
#RUN wget -q https://ftp.ncbi.nih.gov/entrez/entrezdirect/install-edirect.sh
#RUN chmod 755 install-edirect.sh && \
#  ./install-edirect.sh <<< "y\n"
#RUN rm ./install-edirect.sh

# Set up user's essential file structure and code base for the tool.
RUN mkdir -p $HOME/.local/share

# Set up user's interface with the external world
RUN mkdir -p $HOME/external_share_in && \
  mkdir -p $HOME/external_share_out

RUN cd

RUN echo "Build Completed."

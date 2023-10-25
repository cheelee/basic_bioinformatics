# Basic Bioinformatics Docker Package
A docker package that provides basic bioinformatics tools in an Ubuntu Linux environment.

This is intended to be a starting point for a potentially shareable common Linux environment
where basic bioinformatics analysis tasks may be performed on small or medium sized examples
or data sets. It was initially created for attendees of a workshop for bioinformatics, but
may be generally useful for others wanting a Linux environment to work with from other
operating systems and platforms.

## Initialize the Package (One-Time Only)

Start Docker.
Review and edit the Dockerfile accordingly.
Build the Docker image - build.sh.
Run the Docker container - run.sh.
From a terminal enter the running container in 

## Use the Package

Start Docker.
Restart the Docker container via the Docker Dashboard.
From a terminal, enter the running container.

## Tools and Bioinformatics topics and concepts supported.

### Basic Linux operations and tools.

Navigating the Linux file and folder environment - tree, pwd, cd, ls. 
Modifying the Linux folder environment - mkdir.
Viewing the content of text files - cat, head, tail.
Finding content lines in text files - grep.
Content manipulation and data extraction - cut, tr, sort, uniq.
Working with shared repositories - git.

### Common bioinformatics workflows.

Review and manipulation of sequence data files (fasta, fastq) - seqtk.
Downloading data (reference sequences, genbank, etc) - efetch.
Evaluation of raw sequenced reads (fastq) - fastqc, multiqc.
No support for kraken2.
De novo assembly of raw sequenced reads into contigs.
Reference-based assembly of raw sequenced reads.
Simple local alignment - water (emboss).
Simple global alignment - needle (emboss).
Nucleotide sequence alignment and identification - blastn.
Protein sequence alignment and identification - blastx, diamond.
Mapping of sequenced reads to reference sequences - minimap2.
Review of reads-to-reference coverage and depth information - samtools.
Automation - python.

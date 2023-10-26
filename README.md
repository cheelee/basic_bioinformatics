# Basic Bioinformatics Docker Package
A docker package that provides basic bioinformatics tools in an Ubuntu Linux environment.

This is intended to be a starting point for a potentially shareable common Linux environment
where basic bioinformatics analysis tasks may be performed on small or medium sized examples
or data sets. It was initially created for attendees of a workshop for bioinformatics, but
may be generally useful for others wanting a Linux environment to work with from other
operating systems and platforms.

## Getting the Package (One-Time Only)

## Initialize the Package (One-Time Only)

### MacOS

1. Start Docker.
2. [Optional] Review and edit the Dockerfile accordingly.
3. [Optional] Modify macos_build_image.sh if you wish to change the default user name, and
location information.
4. [Optional] Modify macos_init_container.sh to use the same user name if you had modified
it in the previous step.
5. Open a Terminal, and go to the folder for this package.
6. Build the Docker image - Run `macos_build_image.sh`
7. Initialize the Docker container - Run `macos_init_container.sh`.

### Windows

1. Start Docker.
2. [Optional] Review and edit the Dockerfile accordingly.
3. [Optional] Modify windows_build_image.bat if you wish to change the default user name, and 
location information.
4. [Optional] Modify windows_init_container.bat to use the same user name if you had modified
it in the previous step.
5. Build the Docker image - Double-click on windows_build_image.bat.
6. Initialize the Docker container - Double-click on windows_init_container.bat.

## Using the Package

### MacOS

1. Start Docker.
2. Ensure that the Docker container (name: "bioinformatics") is running via the Docker Dashboard.
3. Open a Terminal, and run the line written inside. If you had changed the user name when
building the image, remember to also use the changed name - 
Run `docker exec --user default_user -it bioinformatics bash`
4. Your Terminal window will not change, but you are now working inside the Ubuntu image.

### Windows

1. Start Docker.
2. Ensure that the Docker container (name: "bioinformatics") is running via the Docker Dashboard.
3. Double-click on windows_start_terminal.bat. This will open a new terminal window, and
it will be inside the Ubuntu image.

## Sharing Data between the Ubuntu Docker image and Host Machine.

This applies to both MacOS and Windows. In the package are two folders `share_in` and 
`share_out` and their counterparts inside the Ubuntu image are `external_share_in` and
`external_share_out` respectively.

From your Host Machine, you can modify files or drag-and-drop files into both folders. From
inside the Ubuntu image, you are only allowed to read from `external_share_in` but you are
allowed to write new files to `external_share_out`.

## Access to External Data from the Ubuntu Docker image.

The Ubuntu image will have access to the Internet in the same way your Host Machine has. You
may run tools and software like git, and wget from inside the image to access the internet
environment like NCBI and Github.

## Tools and Bioinformatics topics and concepts supported.

### Basic Linux operations and tools.

It is beyond the scope of this package to cover all of standard Linux use. Please consult
other tutorials and guides. The following are general categories of tasks that are
supported in this package.

- Navigating the Linux file and folder environment - tree, pwd, cd, ls. 
- Modifying the Linux folder environment - mkdir, rmdir, mv.
- Modifying Linux files - cp, rm, mv.
- Viewing the content of text files - cat, head, tail.
- Finding content lines in text files - grep.
- Content manipulation and data extraction - cut, tr, sort, uniq.
- Working with shared repositories - git.

### Common bioinformatics workflows.

- Review and manipulation of sequence data files (fasta, fastq) - seqtk.
- Downloading data (reference sequences, genbank, etc) - efetch. Unfortunately there are 
currently problems getting efetch to install cleanly, and this package is not provided
here.
- Evaluation of raw sequenced reads (fastq) - fastqc, multiqc.
- Simple taxonomic identification of reads - kraken2. No support for kraken2 is provided
here because of the large sizes of databases required to allow it to work well.
- De novo assembly of raw sequenced reads into contigs - Trinity.
- Review the quality of assemblies - Quast. No support for Quast is provided in this
package.
- Reference-based assembly and consensus of raw sequenced reads - multiple steps involving
tools like bwa for Illumina reads, or minimap2 for Oxford nanpore reads. Beyond the scope
of this package.
- Simple local alignment - water (emboss).
- Simple global alignment - needle, stretcher (emboss).
- Nucleotide sequence alignment and identification - blastn.
- Protein sequence alignment and identification - blastx, diamond.
- Mapping of sequenced reads to reference sequences - minimap2.
- Review of reads-to-reference coverage and depth information - samtools.
- Multiple alignment of sequences of similar length - mafft.
- Phylogenetic tree building - raxml.
- Automation - python. No guide is provided here. Seek tutorials on python online as the
use cases are very varied.

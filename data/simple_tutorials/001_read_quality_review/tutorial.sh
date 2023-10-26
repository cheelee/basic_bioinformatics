# Work from this folder

# Create a soft link to the example file with Illumina reads
#   The file contains paired-end reads with forward and
#   reverse reads interleaved.
ln -s ~/data/examples/sars_cov2_ncbi_sra_reads/SRR26474585.fastq.gz

# Create a folder to hold our output. It is placed with our shared folder
#   to make it convenient to view the HTML output from your Host Machine.
mkdir ~/external_share_out/fastqc

# Run the quality evaluation tool fastqc
fastqc SRR26474585.fastq.gz -o ~/external_share_out/fastqc

# OUTPUT:
#   You should be able to see the file "SRR26474585_fastqc.html" show up
#   on the "share_out" folder on your Host Machine. Double-click on it to
#   view the analysis on your web browser.

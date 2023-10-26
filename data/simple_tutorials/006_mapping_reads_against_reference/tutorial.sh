# Link the set of reads.
ln -s ~/data/examples/sars_cov2_ncbi_sra_reads/SRR26474585.fastq.gz 

# Convert the FASTQ content to FASTA
seqtk seq -a SRR26474585.fastq.gz > reads.fasta

# Map the reads to the reference sequence
minimap2 ~/data/references/sars_cov2_ncbi_refseq_NC_045512.2.fna reads.fasta -a -o sars.sam

# Process the alignment file to produce an indexed BAM.
samtools sort sars.sam -o sars.bam
samtools index sars.bam

# Review the coverage of the reads against the reference.
samtools coverage sars.bam | column -t

# View the alignment in text-graphics
samtools tview sars.bam

# Optional: Copy the BAM and index file out to the shared folder.
#  You can view the alignment information on the Host Machine via a tool like UGene or
#  Geneious.

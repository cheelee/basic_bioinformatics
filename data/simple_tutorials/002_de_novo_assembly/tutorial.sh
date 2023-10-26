# Create a soft link to the read data from NCBI
#
ln -s ~/data/examples/sars_cov2_ncbi_sra_reads/SRR26474585.fastq.gz

# Use Trinity to apply de novo assembly. The --single option is used with --run_as_paired
#  because the FASTQ file supplied by NCBI has forward and reverse paired-end reads
#  interleaved in the file.
#
#  Read_1_forward
#  Read_1_reverse
#  Read_2_forward
#  Read_2_reverse
#
# This step may take a while to run.
# The detailed intermediate files are kept in the sars_trinity_assembly folder.
# The assembled contigs are written as sars_trinity_assembly.Trinity.fasta.
#
# Keep the assembled contigs for other tutorial guides.
Trinity --seqType fq --max_memory 4G --single ~/external_share_in/SRR26474585.fastq.gz --run_as_paired --output sars_trinity_assembly

# Inspect the contigs assembled using seqtk
#
seqtk comp sars_trinity_assembly.Trinity.fasta

# Choose an interesting contig (they may be different each time you run Trinity)
# The choice made here is "TRINITY_DN7_c0_g1_i1" with a contig length of 9919.
#
# We now extract only that contig into its own FASTA file.
#
# First we create a names.lst file with the contig we want.
echo "TRINITY_DN7_c0_g1_i1" > names.lst

# Now we use seqtk to create a new FASTA file.
seqtk subseq sars_trinity_assembly.Trinity.fasta names.lst > interesting_contig.fasta

# We can use this interesting contig for local alignment against the reference genome.
# This is also covered in the subsequent tutorial on local alignment.
#
water interesting_contig.fasta ~/data/references/sars_cov2_ncbi_refseq_NC_045512.2.fna

# Hit enter three times. This may take a while to complete.
# Now you can view the local alignment output.
head -50 trinity_dn7_c0_g1_i1.water

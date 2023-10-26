# We can use global alignment to compare two sequences of similar length.
#   We can use needle, but that tool is very memory intensive and will
#   fail for our example in this environment. Instead we can use stretcher.
# Hit return once.
stretcher ~/data/references/sars_cov2_ncbi_refseq_NC_045512.2.fna ~/data/references/sars_cov2_ncbi_genbank_20220609_ON718706.1.fasta

# Review the global alignment between the two reference sequences.
head -50 nc_045512.stretcher

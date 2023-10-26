# Combine all our references into a single FASTA file
cat ~/data/references/sars_cov2_ncbi_* >> all_sars.fasta

# Apply multiple-alignment to the combined FASTA file (with sequences of
#   similar length.) PHY is a Phylip file which is structurally similar
#   to a FASTA file and for most tools can be used interchangeably.
mafft --auto all_sars.fasta > multiple_alignment.phy

# Copy the multiple-alignment file so it is visible on the Host Machine.
#   this file can then be viewed by other tools such as UGene.
cp multiple_alignment.phy ~/external_share_out/

# The multiple alignment file can also be used as input to a Phylogenetic
#   Tree building tool. This package contains RAxML (raxmlHPC) but it is
#   an older tool that we have not yet tested.

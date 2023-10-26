# We can test various PCR primers against the reference.
#
# Extract the forward primer from the primers file.
echo "NH-CS_1_F" > forward.lst
seqtk subseq ~/data/examples/sars_cov2_pcr_primers/primers.fasta forward.lst > nh_cs_1_forward.fasta

# Extract the reverse primer from the primers file.
echo "NH-CS_1_R" > reverse.lst
seqtk subseq ~/data/examples/sars_cov2_pcr_primers/primers.fasta reverse.lst > nh_cs_1_reverse.fasta

# Perform local alignment of the forward primer against the reference.
# Hit return 3 times.
water nh_cs_1_forward.fasta ~/data/references/sars_cov2_ncbi_refseq_NC_045512.2.fna

# Review the forward primer local alignment.
cat nh-cs_1_f.water

# Perform local alignment of the reverse primer against the reference.
# Hit return 3 times.
water nh_cs_1_reverse.fasta ~/data/references/sars_cov2_ncbi_refseq_NC_045512.2.fna

# Review the reverse primer local alignment.
cat nh-cs_1_r.water

# Notice the reverse alignment isn't good. It is not a good match, and the 
#   alignment location appears to be very far away from the perfect hit of the
#   forward primer which cannot be true for an amplicon fragment with an expected
#   length of 216.
#
# Now we try the reverse complement of the reverse primer.
seqtk seq -r nh_cs_1_reverse.fasta > nh_cs_1_reverse_rc.fasta

# Try the local alignment again with the reverse-complement primer.
# Hit return ONLY TWO times.
# Type "nh-cs_1_r_rc.water" for the last option.
water nh_cs_1_reverse_rc.fasta

# Now we can review the reverse-complement alignment of the reverse primer.
cat nh-cs_1_r_rc.water

# You can now confirm that the forward and reverse primers will amplify a
#   fragment of length 216. 

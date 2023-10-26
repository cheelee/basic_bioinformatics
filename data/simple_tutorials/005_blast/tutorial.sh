# Link to the AMR BLAST databases
ln -s ~/data/databases/amr

# Use Nucleotide BLAST for a set of assembled bacteria contigs against the NCBI
#   AMR database.
# For simplicity, we can output a table of hits using outfmt 6. The fields are:
#   Query ID (contig), Subject ID (AMR Gene), Percentage Identity, Length of the match.
# For more advanced processing, you may want to try writing to a JSON file with
#   outfmt 15.
# As an example:
#   blastn -db amr/ncbi/sequences -query ~/data/examples/amr_bacteria_example/SPAdes_contigs.fasta 
#      -out amr_out.json -outfmt 15
blastn -db amr/ncbi/sequences -query ~/data/examples/amr_bacteria_example/SPAdes_contigs.fasta -out amr_out.txt -outfmt "6 qseqid sseqid pident length"

# View the AMR hit table.
# Advanced processing using JSON output is beyond the scope of this tutorial. 
column -t amr_out.txt

# Tools and commands to manipulate fasta files

## Subsetting sequences based on fasta headers
**tool seqtk**

Get a list of all sequence IDs
> Example: get all fasta headers from a fasta file \
`bash grep '^>' file_name.fasta | grep 'filter_group' | sed 's/>//g'  > list_of_fastaheaders.txt`

Extract subset of selected fasta headers from the fasta file 
```bash
seqtk subseq   file_name.fasta  list_of_fastaheaders.txt   > subset_file_name.fasta
```

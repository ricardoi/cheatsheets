# NCBI comman line tools 

Basic commands to construct a blast database, run blast and other useful commands

## Make Blast DataBase 

The makeblastdb application produces BLAST databases from FASTA files. Assigning a unique identifier to every 
sequence in the database allows you to retrieve the sequence by identifier and allows you to associate every 
sequence with a taxonomic node (through the taxid of the sequence). The unique identifier can be a simple string 
(as in the example below) or could be actual accession of the sequence if the sequence comes from a public database 
(e.g., GenBank). The identifier should begin right after the “>” sign on the definition line and contain no spaces 
and the -parse_seqids flag should be used. Taken from [NCBI](https://www.ncbi.nlm.nih.gov/books/NBK569841/)

```bash
$ makeblastdb -in test.fasta -parse_seqids -taxid_map test_map.txt -title "My New DataBase" -dbtype nucl
```


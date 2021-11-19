# BLAST++ 
## Basic Local Alignment Search Tool: basic usage


### Blast remote
Blast remote is a very usefull commands because allows to connect to GenBank to serch on their most recent databases, withouth the need to have a database locally. Consider that uses sftp to connect remotely to the GenBank database, so it could get slower.
```bash
# BLASTn nucleotide search on nucleotides database
blastn -query FILE.fasta -remote -db nr -out contigs_blastx        
# BLASTx nucleotide search on proteins database
blastx -query FILE.fasta -remote -db nr -out contigs_blastx        
# BLASTp protein sequence search on protein database
blastx -query FILE.fasta -remote -db nr -out contigs_blastx        
```
### Blast all uses a flag to indicate the search 
```bash 
blastall -i FILE.fasta -d DATABASE.local -p blastn -o out_contigs_blast.txt -a 6
```
**BLASTn** nucleotide vs nucleotides 
```bash
blastn -query LS12-703-506_k64ml-contigs.fa -db /home/administrator/vDB/pvirusDB/pvirusDB -out LS12-703-506_k64ml-contigs_blastn  -num_threads 4 
```
**BLASTx** nuelcotide vs aminoacids
```bash 
blastx -query LS12-701-503_ak64-contigs.fa -db /home/administrator/vDB/U95/plant_206_U95/U95Prot/vU95prot -out  LS12-701-503_ak64-contigs_blastx_vU95 -num_threads 4  
```


## Creating databases
Blast database\
```bash
makeblastdb -in Viral_nucleic_acid_database -out virusDB -dbtype nucl -hash_index
```
-----
## Tutorial
BLast analysis\
`blastall  -i filename_input.fa -d virusDB -p blastn -o  filename_ouput.txt -m 5 -a 4`\
> Notes:  
-i refers to the input file\
-d refers to the DataBase\
-p refers to the program to use in this case blastn\
-o refers to the output name\
-m refers to the output format (see formats http://tinyurl.com/mhpzc3v) \
-a refers to the number of threads to use\
-F dust refers to avoid Karlin-Altschul parameter.

##### blast loops
An example searching over multiple files
`$./multi_blast.sh`
```bash
for k in {20..40}; 
do
	blastall -i Grassy_contigs-k$k.fa -d vir_oidDB -p blastn -o grassy_blast_k$k.fa -a 6
done
```

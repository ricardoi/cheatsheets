## Pop Genetics 

_Sphaeruina musiva_ is a fungal pathogen infecting poplar trees, populations genetics studies shown that _S. musiva_ is -______-, showing geographical distributions patters. However, sequencing technologies have allow the reconstruction of high quality genome sequences. 



## Methods for variant calling with GATK/traditional way

# 1. index the reference fasta

`gatk CreateSequenceDictionary -R Smusiva_v14_pmchr.fasta

samtools faidx Smusiva_v14_pmchr.fasta

bwa index Smusiva_v14_pmchr.fasta
`
 
# 2. combine R1 & R2 of the reads into a SAM file

`bwa mem REF.fasta ID_R1.fastq ID_R2.fastq > ID.sam`
- This was iterated over all of the read files we had
 
# 3. add read group to the sam file

`java -jar DIRECTORY/picard.jar AddOrReplaceReadGroups -I ID.sam -O ID.rg.sam -RGID ID -RGLB ID -RGPL Illumna -RGPU ID -RGSM ID`
 
# 4. sort the sam file, conver to bam file, and index output

`java -jar DIRECTORY/picard.jar SortSam -I ID.rg.sam -O ID.bam -SORT_ORDER coordinate -CREATE_INDEX true`
 
# 5. Mark duplicates, write them out to .mdup, filter bam file, and index output

`java -jar DIRECTORY/picard.jar MarkDuplicates -I ID.bam -O ID.mdup.bam -M ID.mdup -ASSUME_SORT_ORDER coordinate -CREATE_INDEX true`
 
# 6. Sort the marked up bam file and index output

`java -jar picard.jar SortSam -I ID.mdup.bam -O ID.sorted.bam -SORT_ORDER coordinate -CREATE_INDEX true`
 
# 7. produce vcf files from the .sorted.bam files

`gatk HaplotypeCaller -R REF.fasta -I ID.sorted.bam -O ID.vcf -ERC GVCF -ploidy 1`
 
# 8. produce a combined vcf file using CombineGVCFs

`gatk CombineGVCFs -R REF.fasta -V ID.vcf -V ID2.vcf (...) -V IDN.vcf -O COMBINED.vcf`

- if you have a lot of files, create a script that prints all of the file names delimited by " -V "
 
# 9. produce a joint genotyping

`gatk GenotypeGVCFs -R REF.fasta -V COMBINED.vcf -O COMBINED.gvcf.vcf`

# 10.  vcfR was used to filter for minimum read depth and mapping quality:

`Chrom1 <- masker(chrom, min_DP = 4, min_MQ = 44)`

`write.vcf(x = chrom1, file = "half_filtered.vcf.gz", mask = TRUE, APPEND = FALSE)`
 
# 11. Vcftools was used to filter for maf:

`vcftools --gzvcf $VCF_IN --remove-indels --maf .014 --recode --stdout | gzip -c > $VCF_OUT`

# 12. In an R script, conduct the dpac and visualize with ADMIXTURE like plot:

`#Read vcf in R environment as vcf object:`

`vcf <- read.vcfR(file = “filtered.vcf.gz")`

`#Convert vcf to genlight object (usable for adgenet)`

`x <- vcfR2genlight(vcf)`

`#PCA`

`grp <- find.clusters(x, max.n.clust=y, n.pca= 100, n.clust=y)`

`##(Where y is the number of clusters (ie, 3 for the macro groupings and 14 for the state-by-state analysis)`

`#DAPC `

`dapc1 <- dapc(x, grp$grp, n.pca = 100, n.da = 3)`

`#Compoplot for visualization`

`compoplot(dapc1, posi="bottomright", txt.leg=paste("Cluster", 1:y), lab=, ncol=1, `

`xlab="Posterior Probability of membership to new sub-population", horiz = TRUE, space = 0, show.lab = TRUE, col=funky(y))`






## Methods for variant calling with graphtyper/pangenome

# 1. Steps 1-4 of the above procedure, and then stop

# 2. generate a text file containing the bam files you want to combine into a comprehensive vcf, each line containing the directory of one bam file

# 3. generate a text file listing all the chromosomes/contigs of teh reference fasta *index* file. one chromosome/contig per line

# 4. run graphtypers genotype function, with the reference file, bam file list, and region list

`graphtyper genotype <REFERENCE.fasta> --sams=<BAM list> --region=<chr/contig file list>`

# 5. this will output a results directory, with subdirectories for the input sites (pangenome) and each contig/chromosome. Within each directory of contig/chromosome, there will be multiple files because they split up the variants by the position on the chromosome (in order). Combine all of the vcf files (excluding the input sites directory) in order of contig/chromosome and position into a text file. 

One can use this command, but it doesn't work for me. So i just manually copy and paste (takes 5 minutes)

https://github.com/DecodeGenetics/graphtyper/wiki/User-guide#concatenate-output-vcf-files

change chr to contig and rename the directories so the last character in the directory name is the number.

`echo chr{1..22} chrX | tr ' ' '\n' | while read chrom; do; if [[ ! -d results/${chrom} ]]; then continue; fi; find results/${chrom} -name "*.vcf.gz" | sort; done > vcf_file_list`

# 6. With this text file, run this command to generate a single, concatenated vcf file:

`bcftools concat --naive --file-list vcf_file_list -Oz -o COMBINED.vcf.gz`

# 7. index the comprehensive vcf

`tabix -p vcf COMBINED.vcf.gz`


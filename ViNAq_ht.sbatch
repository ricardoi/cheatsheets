#!/bin/bash
#SBATCH --account=epi
#SBATCH --qos=epi-b
#SBATCH --job-name=ViNAq
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ralcala@ufl.edu
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#SBATCH --mem=32gb
#SBATCH --time=80:00:00
#SBATCH --output=ViNAq_%j.out
#SBATCH --array=1-981%100
date; hostname; pwd
#Mapping

#@ Execute this program using this command
#@
# sbatch ViNAq-ht.sbatch res_ViNAt

##two methods
module load ufrc
module load trinity 
module load bowtie 
module load samtools
module load rsem 
module load bbmap 
module load sambamba

#@ probably i will need to do add PATH1=$1
DIR=$1

#ls -l "$DIR"/*.pdf | awk '{print $9}' | cut -d '_' -f1 | sed '/^$/d' > ./ID.vina
#chmod 444 ID.vina
#echo "$DIR"
 	echo "ViNAq begins the processes :::"
#		if ID.vina permission denied ... is 0k"

ID=$(ls "$DIR"/*_meta-index/*.pdf | cut -d '_' -f2 | cut -d '/' -f2 | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo "PATH to" "$DIR" "processing sample:::" "$ID"

#while IFS= read -r ID
#	do	  
	  echo "processing" "$ID"
#@ step 1: trinity module
align_and_estimate_abundance.pl --seqType fq \
 --single 1-data/papa_reads/"$ID".clean.fq \
 --transcripts "$DIR"/"$ID"_meta-index/"$ID"_meta-index.fasta \
 --est_method RSEM --aln_method bowtie \
 --trinity_mode --prep_reference --output_dir VINA_results/"$ID"_results
##this will generate a conut table with RPKM of each contig in your contig file
	  echo "building bowtie" "$ID"
##2)using bbmap
bowtie-build -f "$DIR"/"$ID"_meta-index/"$ID"_meta-index.fasta "$DIR"/"$ID"_meta-index/"$ID"_vgenome
#bowtie -x "$ID"_vgenome -r data/reads_fastq/"$ID".fastq -S "$ID"_v.sam # paired-end
bowtie -S "$DIR"/"$ID"_meta-index/"$ID"_vgenome 1-data/papa_reads/"$ID".clean.fq "$DIR"/"$ID"_meta-index/"$ID"_vgenome.sam --best #single-end
	  echo "loading samtols"
#formatting
module load samtools
samtools view -bS -o "$DIR"/"$ID"_meta-index/"$ID"_vgenome.bam "$DIR"/"$ID"_meta-index/"$ID"_vgenome.sam
samtools sort "$DIR"/"$ID"_meta-index/"$ID"_vgenome.bam -o "$DIR"/"$ID"_meta-index/"$ID"_vgenome.sorted.bam
samtools index "$DIR"/"$ID"_meta-index/"$ID"_vgenome.sorted.bam
pileup.sh in="$DIR"/"$ID"_meta-index/"$ID"_vgenome.sorted.bam out=rpkm_results/"$ID"_stats.txt rpkm=rpkm_results/"$ID"_rpkm_file.csv
#done <<< "$input_file"

echo "Processed:" "$ID"
#done
#@ This will generate stat.txt with whole stats and rpkm_file with RPkM vaule of each contig

#@ Need to integrate file for sorting files: 
#echo "Sorting files"

#tdir=$(mktemp -d ViNA_folder.XXXXX)
#todir=("2-sequence/")
#echo "$tdir"
#sh file_sorter_aswp.sh "$todir"

# Cheat sheet documentation

### @author: Ricardo I. Alcala

Personal notes, and code collected through the years finding solutions.


##### bash
If you need an introduction to ```bash``` command lines go to this [document](https://github.com/ricardoi/cheatsheets/blob/master/commandsUNIX.pdf)

> Basic commands: \
> `mkdir` - make a new direcotry \
> `ls ` - list the directories \
> `ls -l` - list the directories as a list \
> `ls -lt` - list the directories as a list by time \
> `cp` - copy a file \
> `mv` - move a file or rename a file \
> If you want more, check the [document](https://github.com/ricardoi/cheatsheets/blob/master/commandsUNIX.pdf)

###### loops in `bash`

There are several ways to do for loops in bash, so far this is my favorite syntax:
```bash
while IFS= read -r line
do
  Rscript --vanilla ~/folder/file.R $line
done < file_with_lines.txt
```

I like this bash script to go trhough multiple files: `useful_script.sh`
```bash
list=$(ls *.fasta | cut -d_ -f1)
while IFS= read -r line
do
  Rscript --vanilla ~/folder/file.R $line
done <<< "list"
```
Then execute it with `sh useful_script.sh`, probably you nedd to `chmod +x useful_script.sh` first. 


###### tricks in bash for fasta manipulation
Fasta files some times are tricky to manipulate, and there are many softwares for fasta manipulations. I prefer using bash commamnds to find fast results, check this [repo](https://github.com/ricardoi/cheatsheets/blob/master/bash%20for%20fasta%20manipulation.md) with  commands to manipulate fasta files.

##### Regular Expressions

Cheatsheet for [RegEx](https://github.com/ricardoi/cheatsheets/blob/master/ReGex101.md

https://observablehq.com/@ricardoi


# Single liners

Mean sequence lenght  
```bash
awk '{/>/&&++a||b+=length()}END{print b/a}' file.fasta
```


## bash commands to manipulate fasta files

### `find` files by size
```bash 
find -maxdepth 1 -size 0 -print
```

### `awk` for subsetting fasta files using an ids.txt list without ">"
```bash
awk 'NR==FNR{n[">"$0];next} f{print f ORS $0;f=""} $0 in n{f=$0}' ids.txt contig_sequences.fa > output.fa
```
### Split multifasta to fasta
```bash
grep -o '.*virus' in_file.fasta > out_file.fasta

```
```bash
awk '/^>/ {s=substr($0,2) ".fasta";print " ">s}; s{print >s}' multi.fasta
```


### to get fasta identifier ">"
```bash
grep -c ">" $1 file_name
```
```
grep -c ‘^>’ filename #faster version
```
### to get length and coverage from fasta
```bash
awk '/^>/{sub(/^>/,"");val=$0;next}  {print val,length($0)}' file.fas > lenghts.txt
```

```bash
seqkit fx2tab --length --name --header-line  foo.fasta
```

```bash
grep '^>'  contigs.fasta | awk -F _  'BEGIN {OFS="\t"} {print $0,$4,$6}' | more
```

### split multifasta to fasta
```bash
awk -F '>' '/^>/ {F=sprintf("%s.fasta", $2); print > F;next;} {print F; close(F)}' < FASTAFILE.fa
```
```
awk  '/^>/{s=++d".fasta"} {print > s}'  <inputFile>
```
### replace spaces with underscores
```bash
for f in *\ *; do mv "$f" "${f// /_}"; done
```

### add extensions
```bash
for f in [0-9]file; do mv "$f" "$f.csv"; done
```

### grep for Acc. No. 
```bash
grep -oh '\w*\.[1:3]\w*' file_name
```
find regex 
```
\w = \word followed by commodin search for '\.1 to 3' end \word commodin 
```
### Remove duplicated sequences in multifasta
```bash
awk '/^>/{f=!d[$1];d[$1]=1}f' input.fa > output.fa
```

## grep for Aswp
```bash 
grep 'CONTIG\|Sbjct' input_file.txt > output_file.fa # keeping CONTIG and sequence

``` 

```
sed 's/Sbjct:[0-9]*//g' input_file.fa # removing Subject withing same file `sed -i.bak

``` 

```
awk '{print $2}' input_file.fa > output_file.fasta # keeping second column
``` 


### Navigation
 * e - go to the end of the current word.
 * E - go to the end of the current WORD.
 * b - go to the previous (before) word.
 * B - go to the previous (before) WORD.
 * w - go to the next word.
 * W - go to the next WORD.


### checki file system limits
```
ulimit -a
```

### Renaming multiple name files 
```bash
for f in *; do 
    mv -- "$f" "$f.fa"
done
```

#### Shell paramater expansion  `${file%.txt}` 
```bash
for f in *.txt; do 
    mv -- "$f" "${f%.txt}.fa"
done
```
The part `${file%.html}` is using the [shell parameter expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) to remove the `.html` part from the filename.

```bash
for filename in *.txt
do
name=$(basename ${filename} .txt}
mv ${filename} ${name}_2019.txt
done
```
``Now the file were save in ${name}_2019.txt``

## Renaming files 
### with basename 
```bash
for filename in *_2019.txt
do
name=$(basename ${filename} _2019.txt)
mv ${filaname} {name}.txt
done
```
### without the rest of the fasta header
```bash
sed 's/virus.*/virus/' file.fasta | sed 's/viroid.*/viroid/' | sed 's/satellite.*/satellite/' > output_file.fasta
```
### replace fasta header with file name
```bash
for FILE in *.fa;
do
 awk '/^>/ {gsub(/.fa(sta)?$/,"",FILENAME);printf(">%s\n",FILENAME);next;} {print}' $FILE > outdir/changed_${FILE}
done
```

#### looping trhough files getting a line
```bash
#!bin/bash
for FILE in *.out;
do
   sed -n 4p $FILE;
done
```

# XML files manipulation with grep 
```bash 
grep -o "<Textseq-id_accession>.*</Textseq-id_accession>" file.xml | cut -d ">" -f 2 | cut -d "<" -f 1
```


## Useful for bash and fasta sequences
https://github.com/crazyhottommy/bioinformatics-one-liners/blob/master/README.md

[http://blog.shenwei.me/manipulation-on-fasta-sequence/](http://blog.shenwei.me/manipulation-on-fasta-sequence/)

-----
Getting the size in human readible way
`du -sh file name`

Good bash script example
[Bash-Beginners-Guide](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_01_05.html)


---

<h2 id="bash-profile--instructions-for-mac">Bash profile  instructions for Mac</h2>
<h4 id="renamemove-your--.bash_profile--file-you-can-do-the-next-things">Rename/move your  <code>~/.bash_profile</code>  file you can do the next things:</h4>
<ol>
<li>Create a new file  <code>~/.zprofile</code></li>
<li>Type there  <code>source ~/.bash_profile</code></li>
<li>Save and close</li>
<li>Run a new terminal session</li>
</ol>
<h3 id="loops">loops</h3>
<pre><code>while IFS= read -r line; do
  Rscript --vanilla ~/folder/file.R $line
done &lt; file_with_lines.txt
</code></pre>
<h3 id="links-to-bash">Links to bash</h3>
<h5 id="operations-in-shell">operations in shell</h5>
<ul>
<li>
<p><a href="https://catonmat.net/set-operations-in-unix-shell">set-operations in shell</a></p>
</li>
<li>
<p><a href="https://ma.ttias.be/grep-show-lines-before-and-after-the-match-in-linux/">grep command</a></p>
</li>
<li>
<p><a href="https://www.oreilly.com/library/view/effective-awk-programming/9781491904930/ch01.html">awk command</a></p>
</li>
<li>
<p><a href="https://www.gnu.org/software/sed/manual/sed.html#advanced-sed">sed command</a></p>
</li>
<li>
<p><a href="https://shopify.dev/docs/themes/liquid/reference/filters">liquid filters</a></p>
</li>
<li>
<p><a href="https://google.github.io/styleguide/shellguide.html">style guide shell</a></p>
</li>
</ul>
<p>– <a href="https://poesiabinaria.net/2013/01/magia-en-bash-49-ejemplos-en-una-sola-linea-o-dos/">49-ejemplos-en-una-sola-linea</a></p>
<h3 id="color-for-terminal">color for terminal</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">export</span> PS1<span class="token operator">=</span><span class="token string">"\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "</span>
<span class="token function">export</span> CLICOLOR<span class="token operator">=</span>1
<span class="token function">export</span> LSCOLORS<span class="token operator">=</span>ExFxBxDxCxegedabagacad
<span class="token function">alias</span> ls<span class="token operator">=</span><span class="token string">'ls -GFh'</span>
<span class="token comment">#### change the prompt</span>
<span class="token comment">#export PS1='==&gt;&gt;'</span>
<span class="token comment">#export PS1='\u@\h: '</span>
<span class="token function">export</span> PS1<span class="token operator">=</span><span class="token string">'\u@ '</span>
</code></pre>
<h3 id="custom-mac">custom Mac</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">export</span>  PS1<span class="token operator">=</span><span class="token string">'\[\033[0;37m\]\u@\[\033[1;31m\]\W\033[0;32m\]\$\[\033[0;37m\]'</span>
<span class="token function">export</span>  CLICOLOR<span class="token operator">=</span>1
<span class="token comment">#export LSCOLORS=ExFxBxDxCxegedabagacad</span>
<span class="token function">export</span>  LSCOLORS<span class="token operator">=</span>BxFxGxDxCxegedabagaced
</code></pre>


---


---

<h2 id="bash-commands-to-manipulate-fasta-files">bash commands to manipulate fasta files</h2>
<h3 id="find-files-by-size"><code>find</code> files by size</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">find</span> -maxdepth 1 -size 0 -print
</code></pre>
<h3 id="awk-for-subsetting-fasta-files-using-an-ids.txt-list-without-"><code>awk</code> for subsetting fasta files using an ids.txt list without “&gt;”</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">awk</span> <span class="token string">'NR==FNR{n["&gt;"<span class="token variable">$0</span>];next} f{print f ORS <span class="token variable">$0</span>;f=""} <span class="token variable">$0</span> in n{f=<span class="token variable">$0</span>}'</span> ids.txt contig_sequences.fa <span class="token operator">&gt;</span> output.fa
</code></pre>
<h3 id="split-multifasta-to-fasta">Split multifasta to fasta</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> -o <span class="token string">'.*virus'</span> in_file.fasta <span class="token operator">&gt;</span> out_file.fasta
</code></pre>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">awk</span> <span class="token string">'/^&gt;/ {s=substr(<span class="token variable">$0</span>,2) ".fasta";print " "&gt;s}; s{print &gt;s}'</span> multi.fasta
</code></pre>
<h3 id="to-get-fasta-identifier-">to get fasta identifier “&gt;”</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> -c <span class="token string">"&gt;"</span> <span class="token variable">$1</span> file_name
</code></pre>
<pre><code>grep -c ‘^&gt;’ filename #faster version
</code></pre>
<h3 id="removing-empty-lines">removing empty lines</h3>
<pre class=" language-bash"><code class ="prism language-bash"><span class="token function">sed</span> -i <span class"token string">'/^$/d'</span>file.txt
</code></pre>
<h3 id="to-get-length-and-coverage-from-fasta">to get length and coverage from fasta</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">awk</span> <span class="token string">'/^&gt;/{sub(/^&gt;/,"");val=<span class="token variable">$0</span>;next}  {print val,length(<span class="token variable">$0</span>)}'</span> file.fas <span class="token operator">&gt;</span> lenghts.txt
</code></pre>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> <span class="token string">'^&gt;'</span>  contigs.fasta <span class="token operator">|</span> <span class="token function">awk</span> -F _  <span class="token string">'BEGIN {OFS="\t"} {print <span class="token variable">$0</span>,<span class="token variable">$4</span>,<span class="token variable">$6</span>}'</span> <span class="token operator">|</span> <span class="token function">more</span>
</code></pre>
<h3 id="split-multifasta-to-fasta-1">split multifasta to fasta</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">awk</span> -F <span class="token string">'&gt;'</span> <span class="token string">'/^&gt;/ {F=sprintf("%s.fasta", <span class="token variable">$2</span>); print &gt; F;next;} {print F; close(F)}'</span> <span class="token operator">&lt;</span> FASTAFILE.fa
</code></pre>
<pre><code>awk  '/^&gt;/{s=++d".fasta"} {print &gt; s}'  &lt;inputFile&gt;
</code></pre>
<h3 id="replace-spaces-with-underscores">replace spaces with underscores</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> f <span class="token keyword">in</span> *\ *<span class="token punctuation">;</span> <span class="token keyword">do</span> <span class="token function">mv</span> <span class="token string">"<span class="token variable">$f</span>"</span> <span class="token string">"<span class="token variable">${f// /_}</span>"</span><span class="token punctuation">;</span> <span class="token keyword">done</span>
</code></pre>
<h3 id="add-extensions">add extensions</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> f <span class="token keyword">in</span> <span class="token punctuation">[</span>0-9<span class="token punctuation">]</span>file<span class="token punctuation">;</span> <span class="token keyword">do</span> <span class="token function">mv</span> <span class="token string">"<span class="token variable">$f</span>"</span> <span class="token string">"<span class="token variable">$f</span>.csv"</span><span class="token punctuation">;</span> <span class="token keyword">done</span>
</code></pre>
<h3 id="grep-for-acc.-no.">grep for Acc. No.</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> -oh <span class="token string">'\w*\.[1:3]\w*'</span> file_name
</code></pre>
<p>find regex</p>
<pre><code>\w = \word followed by commodin search for '\.1 to 3' end \word commodin 
</code></pre>
<h3 id="remove-duplicated-sequences-in-multifasta">Remove duplicated sequences in multifasta</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">awk</span> <span class="token string">'/^&gt;/{f=!d[<span class="token variable">$1</span>];d[<span class="token variable">$1</span>]=1}f'</span> input.fa <span class="token operator">&gt;</span> output.fa
</code></pre>
<h2 id="grep-for-aswp">grep for Aswp</h2>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> <span class="token string">'CONTIG\|Sbjct'</span> input_file.txt <span class="token operator">&gt;</span> output_file.fa <span class="token comment"># keeping CONTIG and sequence</span>

</code></pre>
<pre><code>sed 's/Sbjct:[0-9]*//g' input_file.fa # removing Subject withing same file `sed -i.bak

</code></pre>
<pre><code>awk '{print $2}' input_file.fa &gt; output_file.fasta # keeping second column
</code></pre>
<h3 id="navigation">Navigation</h3>
<ul>
<li>e - go to the end of the current word.</li>
<li>E - go to the end of the current WORD.</li>
<li>b - go to the previous (before) word.</li>
<li>B - go to the previous (before) WORD.</li>
<li>w - go to the next word.</li>
<li>W - go to the next WORD.</li>
</ul>
<h3 id="checki-file-system-limits">checki file system limits</h3>
<pre><code>ulimit -a
</code></pre>
<h3 id="renaming-multiple-name-files">Renaming multiple name files</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> f <span class="token keyword">in</span> *<span class="token punctuation">;</span> <span class="token keyword">do</span> 
    <span class="token function">mv</span> -- <span class="token string">"<span class="token variable">$f</span>"</span> <span class="token string">"<span class="token variable">$f</span>.fa"</span>
<span class="token keyword">done</span>
</code></pre>
<h4 id="shell-paramater-expansion--file.txt">Shell paramater expansion  <code>${file%.txt}</code></h4>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> f <span class="token keyword">in</span> *.txt<span class="token punctuation">;</span> <span class="token keyword">do</span> 
    <span class="token function">mv</span> -- <span class="token string">"<span class="token variable">$f</span>"</span> <span class="token string">"<span class="token variable">${f%.txt}</span>.fa"</span>
<span class="token keyword">done</span>
</code></pre>
<p>The part <code>${file%.html}</code> is using the <a href="https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html">shell parameter expansion</a> to remove the <code>.html</code> part from the filename.</p>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> filename <span class="token keyword">in</span> *.txt
<span class="token keyword">do</span>
name<span class="token operator">=</span><span class="token punctuation">$(</span>basename <span class="token variable">${filename}</span> .txt<span class="token punctuation">}</span>
<span class="token function">mv</span> <span class="token variable">${filename}</span> <span class="token variable">${name}</span>_2019.txt
<span class="token keyword">done</span>
</code></pre>
<p><code>Now the file were save in ${name}_2019.txt</code></p>
<h2 id="renaming-files">Renaming files</h2>
<h3 id="with-basename">with basename</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> filename <span class="token keyword">in</span> *_2019.txt
<span class="token keyword">do</span>
name<span class="token operator">=</span><span class="token variable"><span class="token variable">$(</span><span class="token function">basename</span> $<span class="token punctuation">{</span>filename<span class="token punctuation">}</span> _2019.txt<span class="token variable">)</span></span>
<span class="token function">mv</span> <span class="token variable">${filaname}</span> <span class="token punctuation">{</span>name<span class="token punctuation">}</span>.txt
<span class="token keyword">done</span>
</code></pre>
<h3 id="without-the-rest-of-the-fasta-header">without the rest of the fasta header</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">sed</span> <span class="token string">'s/virus.*/virus/'</span> file.fasta <span class="token operator">|</span> <span class="token function">sed</span> <span class="token string">'s/viroid.*/viroid/'</span> <span class="token operator">|</span> <span class="token function">sed</span> <span class="token string">'s/satellite.*/satellite/'</span> <span class="token operator">&gt;</span> output_file.fasta
</code></pre>
<h3 id="replace-fasta-header-with-file-name">replace fasta header with file name</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token keyword">for</span> FILE <span class="token keyword">in</span> *.fa<span class="token punctuation">;</span>
<span class="token keyword">do</span>
 <span class="token function">awk</span> <span class="token string">'/^&gt;/ {gsub(/.fa(sta)?$/,"",FILENAME);printf("&gt;%s\n",FILENAME);next;} {print}'</span> <span class="token variable">$FILE</span> <span class="token operator">&gt;</span> outdir/changed_<span class="token variable">${FILE}</span>
<span class="token keyword">done</span>
</code></pre>
<h4 id="looping-trhough-files-getting-a-line">looping trhough files getting a line</h4>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token comment">#!bin/bash</span>
<span class="token keyword">for</span> FILE <span class="token keyword">in</span> *.out<span class="token punctuation">;</span>
<span class="token keyword">do</span>
   <span class="token function">sed</span> -n 4p <span class="token variable">$FILE</span><span class="token punctuation">;</span>
<span class="token keyword">done</span>
</code></pre>
<h1 id="xml-files-manipulation-with-grep">XML files manipulation with grep</h1>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">grep</span> -o <span class="token string">"&lt;Textseq-id_accession&gt;.*&lt;/Textseq-id_accession&gt;"</span> file.xml <span class="token operator">|</span> <span class="token function">cut</span> -d <span class="token string">"&gt;"</span> -f 2 <span class="token operator">|</span> <span class="token function">cut</span> -d <span class="token string">"&lt;"</span> -f 1
</code></pre>
<h2 id="useful-for-bash-and-fasta-sequences">Useful for bash and fasta sequences</h2>
<p><a href="https://github.com/crazyhottommy/bioinformatics-one-liners/blob/master/README.md">https://github.com/crazyhottommy/bioinformatics-one-liners/blob/master/README.md</a></p>
<p><a href="http://blog.shenwei.me/manipulation-on-fasta-sequence/">http://blog.shenwei.me/manipulation-on-fasta-sequence/</a></p>
<hr>
<p>Getting the size in human readible way<br>
<code>du -sh file name</code></p>
<p>Good bash script example<br>
<a href="https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_01_05.html">Bash-Beginners-Guide</a></p>


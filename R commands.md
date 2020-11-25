---


---

<h2 id="r-commands">R Commands:</h2>
<h4 id="load-multiple-cvs-at-once">Load multiple CVS at once</h4>
<pre><code>files = list.files(pattern="*.csv")
</code></pre>
<p><strong>Splitng the csv file</strong></p>
<pre class=" language-r"><code class="prism  language-r">names <span class="token operator">&lt;-</span> as.data.frame<span class="token punctuation">(</span>files<span class="token punctuation">)</span> <span class="token percent-operator operator">%&gt;%</span> 
        separate<span class="token punctuation">(</span>files<span class="token punctuation">,</span> into<span class="token operator">=</span>c<span class="token punctuation">(</span><span class="token string">"names"</span><span class="token punctuation">,</span> <span class="token string">"ext"</span><span class="token punctuation">)</span><span class="token punctuation">,</span> sep<span class="token operator">=</span> <span class="token string">"[.]"</span><span class="token punctuation">)</span> 
</code></pre>
<p><strong>loading the csv into a list</strong></p>
<pre><code>ls = list(NULL)
for (i in 1:length(files)){
  x &lt;- read.csv(files[i], as.is=T)
  x$IDs &lt;-  rep(names$names[i], nrow(x))
  ls[[i]] = x
}
ls[[1]]
</code></pre>
<p><strong>rbind the # samples to creat the Master_table</strong></p>
<pre><code>new_file &lt;- rbind.fill(ls)
</code></pre>
<p>#------------------------------------------------------------------------------------<br>
<strong>write a list as csv</strong></p>
<pre><code>lapply(list, function(x) write.table( data.frame(x), 'list_out.csv'  , append= T, sep=',' ))
</code></pre>
<p><a href="http://adv-r.had.co.nz/Style.html">Style guide R</a><br>
<a href="http://adv-r.had.co.nz/Functions.html">Advance Functions</a><br>
<a href="http://adv-r.had.co.nz/Environments.html">Environments</a></p>


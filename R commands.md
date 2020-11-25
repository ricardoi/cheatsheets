<h2 id="r-commands">R Commands:</h2>
<h4 id="load-multiple-cvs-at-once">Load multiple CVS at once</h4>
<pre><code>files = list.files(pattern="*.csv")
</code></pre>
<p><strong>Splitng the csv file</strong></p>
<pre><code>names lt;<- as.data.frame(files) %&gt;%
	separate(files, into=c("names", "ext"), sep= "[.]")
</code></pre>
<p><strong>loading the csv into a list</strong></p>
<pre><code>ls = list(NULL)
for (i in 1:length(files)){
	x &lt;- read.csv(files[i], as.is=T)
	x$IDs &lt;- rep(names$names[i], nrow(x))
	ls[[i]] = x
}
ls[[1]]
</code></pre>
<p><strong>rbind the # samples to creat the Master_table</strong></p>
<pre><code>new_file &lt;- rbind.fill(ls)
</code></pre>
<hr>
<p><strong>write a list as csv</strong></p>
<pre><code>lapply(list, function(x) write.table( data.frame(x),
	'list_out.csv' , append= T, sep=',' ))`
</code></pre>
<p><a href="`http://adv-r.had.co.nz/Style.html">Style guide R</a><br>
<a href="s](http://adv-r.had.co.nz/Functions.html">Advance Functions</a><br>
<a href=")
[Environmenthttp://adv-r.had.co.nz/Environments.html">Environments</a></p>
)
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgzNTEwNTMxMF19
-->
---


---

<h2 id="bash-profile--instructions">Bash profile  instructions</h2>
<h4 id="renamemove-your--.bash_profile--file-you-can-do-the-next-things">Rename/move your  <code>~/.bash_profile</code>  file you can do the next things:</h4>
<ol>
<li>Create a new file  <code>~/.zprofile</code></li>
<li>Type there  <code>source ~/.bash_profile</code></li>
<li>Save and close</li>
<li>Run a new terminal session</li>
</ol>
<h3 id="loops">loops</h3>
<pre><code>while IFS= read -r line
do
Rscript --vanilla ~/folder/file.R $line
done &lt; file_with_lines.txt
</code></pre>
<h3 id="links-to-bash">Links to bash</h3>
<p><a href="https://poesiabinaria.net/2013/01/magia-en-bash-49-ejemplos-en-una-sola-linea-o-dos/">49-ejemplos-en-una-sola-linea</a></p>
<h5 id="operations-in-shell">operations in shell</h5>
<p><a href="https://catonmat.net/set-operations-in-unix-shell">set-operations in shell</a><br>
<a href="https://ma.ttias.be/grep-show-lines-before-and-after-the-match-in-linux/">grep command</a></p>
<p><a href="https://www.oreilly.com/library/view/effective-awk-programming/9781491904930/ch01.html">awk command</a></p>
<p><a href="https://www.gnu.org/software/sed/manual/sed.html#advanced-sed">sed command</a></p>
<p><a href="https://shopify.dev/docs/themes/liquid/reference/filters">liquid filters</a></p>
<p><a href="https://google.github.io/styleguide/shellguide.html">style guide shell</a></p>
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
<h3 id="my-mac">My Mac</h3>
<pre class=" language-bash"><code class="prism  language-bash"><span class="token function">export</span>  PS1<span class="token operator">=</span><span class="token string">'\[\033[0;37m\]\u@\[\033[1;31m\]\W\033[0;32m\]\$\[\033[0;37m\]'</span>
<span class="token function">export</span>  CLICOLOR<span class="token operator">=</span>1
<span class="token comment">#export LSCOLORS=ExFxBxDxCxegedabagacad</span>
<span class="token function">export</span>  LSCOLORS<span class="token operator">=</span>BxFxGxDxCxegedabagaced
</code></pre>


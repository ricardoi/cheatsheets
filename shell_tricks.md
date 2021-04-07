---


---

<h2 id="bash-profile--instructions">Bash profile  instructions</h2>
<h4 id="color-for-terminal">color for terminal</h4>
<p>export PS1="[\033[36m]\u[\033[m]@[\033[32m]\h:[\033[33;1m]\w[\033[m]$ "</p>
<p>export CLICOLOR=1</p>
<p>export LSCOLORS=ExFxBxDxCxegedabagacad</p>
<p>alias ls=‘ls -GFh’</p>
<h4 id="change-the-prompt">change the prompt</h4>
<p>#export PS1=’==&gt;&gt;’</p>
<p>#export PS1=’\u@\h: ’</p>
<p>export PS1=’\u@ ’</p>
<h3 id="my-mac">My Mac</h3>
<p>export  PS1=’[\033[0;37m]\u@[\033[1;31m]\W\033[0;32m]$[\033[0;37m]’<br>
export  CLICOLOR=1<br>
#export LSCOLORS=ExFxBxDxCxegedabagacad<br>
export  LSCOLORS=BxFxGxDxCxegedabagaced</p>
<h4 id="renamemove-your--.bash_profile--file-you-can-do-the-next-things">Rename/move your  <code>~/.bash_profile</code>  file you can do the next things:</h4>
<ol>
<li>Create a new file  <code>~/.zprofile</code></li>
<li>Type there  <code>source ~/.bash_profile</code></li>
<li>Save and close</li>
<li>Run a new terminal session</li>
</ol>
<h3 id="loops">loops</h3>
<pre><code>while read line
do
while read name
do
cat $line &gt; temp2
OUTPUT=$(mv -n temp2 $name.fas)
done &lt; acc
if [[ ${OUTPUT} != 0 ]];then
break
fi
done &lt; temp
</code></pre>
<h3 id="links-to-bash">Links to bash</h3>
<p><a href="https://poesiabinaria.net/2013/01/magia-en-bash-49-ejemplos-en-una-sola-linea-o-dos/">49-ejemplos-en-una-sola-linea</a></p>
<p><a href="https://catonmat.net/set-operations-in-unix-shell">set-operations-in-unix-shell</a><br>
<a href="https://ma.ttias.be/grep-show-lines-before-and-after-the-match-in-linux/">grep</a></p>
<p><a href="https://www.oreilly.com/library/view/effective-awk-programming/9781491904930/ch01.html">awk</a></p>
<p><a href="https://www.gnu.org/software/sed/manual/sed.html#advanced-sed">sed</a></p>
<p><a href="https://shopify.dev/docs/themes/liquid/reference/filters">https://shopify.dev/docs/themes/liquid/reference/filters</a></p>
<p><a href="https://google.github.io/styleguide/shellguide.html">style guide shell</a></p>


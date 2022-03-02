---


---

<h3 id="git-hub">Git Hub</h3>
<ul>
<li>
<h2 id="checking-first">Checking first</h2>
<pre><code>git init
git status
</code></pre>
</li>
<li>
<h2 id="clonning-repo">Clonning repo</h2>
<pre><code>git clone repository http://github.io/repo_name
</code></pre>
</li>
<li>
<h2 id="adding-files">Adding files</h2>
<pre><code>git add .
</code></pre>
</li>
<li>
<h2 id="commiting-files-in-line-commenting">Commiting files in-line commenting</h2>
<pre><code>git commit -m 'first commit of files'
</code></pre>
</li>
<li>
<h2 id="exexute">Exexute</h2>
<pre><code>git push
git pull
</code></pre>
<p>if problems persist, force</p>
<pre><code>git push -f
</code></pre>
</li>
</ul>
<h1 id="one-commit-ahead">One commit ahead</h1>
<ul>
<li>
<h2 id="commit-the-change-using">Commit the change using</h2>
<pre><code>git commit -m "My message"
</code></pre>
</li>
<li>
<h2 id="stash-it.">Stash it.</h2>
<p>Stashing acts as a stack, where you can push changes, and you pop them in reverse order.</p>
<p>To stash, type</p>
<pre><code>git stash
</code></pre>
<p>Do the merge, and then pull the stash:</p>
<pre><code>git stash pop
</code></pre>
</li>
<li>
<h2 id="discard-the-local-changes">Discard the local changes</h2>
<p>Using</p>
<pre><code>git reset --hard
</code></pre>
<p>or</p>
<pre><code>git checkout -t -f remote/branch
</code></pre>
</li>
</ul>

```bash
$ git rm --cached FILE_TO_REMOVE
$ git commit --amend -CHEAD # or -m 'comment'?
$ git push
```

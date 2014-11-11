---
layout: blost
---

So you want to build a Github-hosted static site for your band? Turns out this is all surprisingly easy...

First, you need the _gh-pages_ gem. Add it to your Gemfile (or just use [ours](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/Gemfile)) and `bundle`, or just

{% raw %}
```
gem install gh-pages
```
{% endraw %}

##Create some content

Create a file called _index.md_ at the root of the project that looks like this:

    ---
    ---

    Hello from Jekyll

Those dashes at the top are _important_ - without them Jekyll doesn't know that you intend this to be content.

Now from a console do

{% raw %}
```
jekyll serve --watch
```
{% endraw %}

and point your browser at [http://localhost:4000/]() and you should see those three words. You have successfully Jekylled.

##A wild *_site* appears

This is all about building a static site, right? What Jekyll has done, is create a directory called *_site* and filled it with the generated HTML of your actual site. This is an artefact and you don't really want it in Github. So

{% raw %}
```
echo _site/ > .gitignore
```
{% endraw %}

to make git leave that well alone. Probably a good time to commit:

{% raw %}
```
git init
git add .
git commit -m 'Committe the Fyrst'
```
{% endraw %}

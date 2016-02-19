---
priority: 1
---

So you want to build a Github-hosted static site for your band? Turns out this is all surprisingly easy...

First, you need the _gh-pages_ gem. Add it to your Gemfile (or just use [ours](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/Gemfile)) and `bundle`, or just

```
gem install gh-pages
```

## Create some content

Create a file called _index.md_ at the root of the project that looks like this:

    ---
    ---

    Hello from Jekyll

Those dashes at the top are _important_ - without them Jekyll doesn't know that you intend this to be content.

Now from a console do

```
jekyll serve --watch
```

and point your browser at [http://localhost:4000/](http://localhost:4000/) and you should see those three words. You have successfully Jekylled.

## A wild *_site* appears

This is all about building a static site, right? What Jekyll has done, is create a directory called *_site* and filled it with the generated HTML of your actual site. This is an artefact and you don't really want it in Github. So

```
echo _site/ > .gitignore
```

to make git leave that well alone. Probably a good time to commit:

```
git init && git add . && git commit -m 'Committe the Fyrst'
```

Now it's time to look at [hosting your site on Github](http://rawfunkmaharishi.uk/blog/2014/11/11/hosting-your-site-on-github/).

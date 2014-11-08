---

---

[![Dependency Status](http://img.shields.io/gemnasium/rawfunkmaharishi/rawfunkmaharishi.github.io.svg)](https://gemnasium.com/rawfunkmaharishi/rawfunkmaharishi.github.io)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://rawfunkmaharishi.mit-license.org)

#How to build a band website and host it on Github

This is all surprisingly easy

##Jekyll

You need the `gh-pages` gem. Add it to your Gemfile (or just use [ours](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/Gemfile)) and `bundle`, or do `gem install gh-pages`

###Create some content

Create a file called `index.md` at the root of the project that looks like this:

```
---
---

Hello from Jekyll
```

Those dashes at the top are _important_ - without them Jekyll doesn't know that you intend this to be content.

Now from a console do `jekyll serve --watch` and point your browser at [http://localhost:4000/]() and you should see those three words. Well done, you have successfully Jekylled.

###A wild *_site* appears

This is all about building a static site, right? What Jekyll has done, is create a directory called *_site* and filled it with the generated HTML of your actual site. This is an artefact and you don't really want it in Github. So `echo _site/ > .gitignore` to make git leave that well alone. Now it's time to commit. But first...

###Github hosting

Github will host this stuff for free, which is incredibly nice of them. Generally, if you push this stuff onto a branch called `gh-pages`, your site will appear at _http://username.github.io/yourproject_ (which is cool for project-specific Jekyll sites); however if the Github repo is named like _username.github.io_ (or _organisationname.github.io_ within a Github organisation), then Github will attempt to Jekylise whatever it finds in `master` - that's why this particular repo is named like it is. For the purposes of this document, I'm going to assume you're working on the second set-up and just using _master_ (and that your account or organisation is called _username_).

So anyway, it's time to commit what you have

```
git init
git add .
git commit -m 'Committe the Fyrst'
```

then, based on all that stuff above about repo naming, go create a Github repo with the appropriate name, then bring that remote in:

```
git remote add origin git@github.com:username/username.github.io.git
```

and push to it

```
git push origin master
```

then point your browser at [http://username.github.io]() and you should see either _Hello from Jekyll_ once again, or a 404 with a message about _It may take up to ten minutes until your page is available_. In this case, go make some tea or something.

###CNAME

So you have some content hosted, for free, on Github, at [http://username.github.io](). But wouldn't it be nice if it was at _http://mysuperawesomedomain.com_ instead? Well that's super-easy, too. You need a CNAME file at the root of the project:

```
echo mysuperawesomedomain.com > CNAME
```

then you need to configure your DNS to point that domain at this Github IP address: _185.31.18.133_ and after waiting the requisite DNS-propagation-time (is it just me or is that _much_ quicker these days than it used to be?), your amazing site will be available at [http://mysuperawesomedomain.com]

##Bootstrap

###Being responsive

##Liquid

##Open Street Map

##Soundcloud

##Flickr

##Vimeo

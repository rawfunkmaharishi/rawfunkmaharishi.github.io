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

then you need to configure your DNS to point that domain at this Github IP address: _185.31.18.133_ and after waiting the requisite DNS-propagation-time (is it just me or is that _much_ quicker these days than it used to be?), your amazing site will be available at [http://mysuperawesomedomain.com]()

##Bootstrap

So you have some content up there, but it's not very pretty, is it? However, the lovely people at Twitter have given us Bootstrap, which allows even the most design-challenged drummers among us to make something that's at least vaguely presentable.

So [download the Sass version of Bootstrap](http://getbootstrap.com/getting-started/#download) (version 3.2.0 as of this writing), untar the archive: `tar xzvf bootstrap-sass-3.3.0.tar.gz` and copy the bits you need into the (root of the) project:

```
mkdir _sass
rsync -av ~/Downloads/bootstrap-sass-3.3.0/assets/stylesheets/bootstrap _sass/
cp ~/Downloads/bootstrap-sass-3.3.0/assets/stylesheets/_bootstrap.scss _sass/bootstrap.scss

mkdir javascript
rsync -av ~/Downloads/bootstrap-sass-3.3.0/assets/javascripts/bootstrap.js javascript/
```

then, because Reasons, make a file:

```
mkdir assets
touch assets/application.scss
```

and fill it out like this:

```
---
---

@import 'bootstrap';
```

###Layouts

You need to include the Bootstrap stylesheets in your pages somehow. You could turn `index.md` into `index.html` and fully configure everything there, but that sounds like a terrible idea, when you could just use a Jekyll layout!

Make a default layout:

```
mkdir _layouts
touch _layouts/default.html
```

and fill it out like this

```
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta http-equiv='X-UA-Compatible' content='IE=edge' />
    <meta name='viewport' content='width=device-width, initial-scale=1' />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
      <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
    <![endif]-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src='/javascript/bootstrap.js'></script>

    <link rel='stylesheet' href='/assets/application.css' type='text/css' />
    <title>{{ page.title }}</title>
  </head>

  <body>
    <div class='container'>
      {{ content }}
    </div>
  </body>
</html>
```

(I totally boosted this from one of the Bootstrap examples)

Now if you look at [http://localhost:4000]() you will see that it's still as ugly as before. What? Well, remember the dashes at the top of some of these files? As well as telling Jekyll that This Page Is For You, they can also contain some YAML configuration (this is what Jekyll calls _Front-matter_). You can say that your page wants to use the _default_ layout that you just made with something like this:

```
---
layout: default
---
```

at the top of your _index.md_ file.

And now, when you go to [http://localhost:4000](), it should be _marginally_ prettier. Probably a good time to commit and push again...

##Liquid

##Components

##Open Street Map

##Soundcloud

##Flickr

##Vimeo

##Being responsive

---
priority: 2
---

Github will host your site for free, which is incredibly nice of them. But for our purposes, there are some things to consider around how the repo is named:

Generally, given a repo named _amazingrepo_, if you push your Jekyll site onto a branch called _gh-pages_, the content will appear under [http://username.github.io/amazingrepo/](http://username.github.io/amazingrepo/) (which is what you want for project-specific Jekyll sites); however there are some names that Github considers special and which are subject to different rules: if the Github repo is named like _username.github.io_, or, within a Github organisation, _organisationname.github.io_, then Github will attempt to Jekylify whatever it finds in _master_  and the content will appear under [http://username.github.io/](http://username.github.io/) - that's why this particular repo is named _rawfunkmaharishi.github.io_. For the purposes of this document, I'm going to assume that you have a Github organisation for your band called _bandname_ and your repo is called _bandname.github.io_ (and that you have control of the _bandname.com_ domain). Does that all make sense?

So anyway, presuming you have some [committed content](http://rawfunkmaharishi.uk/blog/2014/11/11/getting-started-with-jekyll/#a-wild-site-appears), go create a Github repo with the appropriate name, then bring that remote in:

```
git remote add origin git@github.com:bandname/bandname.github.io.git
```

and push to it

```
git push origin master
```

then point your browser at [http://bandname.github.io/](http://bandname.github.io/) and you should see either _Hello from Jekyll_ once again, or a 404 with a message about _It may take up to ten minutes until your page is available_. In this case, go make some tea or something.

## CNAME

So you have some content hosted, for free, on Github, at [http://bandname.github.io/](http://bandname.github.io/). But wouldn't it be nice if it was at [http://bandname.com](http://bandname.github.io/) instead? Well that's super-easy, too. You need a CNAME file at the root of the project (and note that you can only have the one CNAME, so you can't have _bandname.com_ and _www.bandname.com_, but it's 2014 and it's probably time we got past that):

```
echo bandname.com > CNAME
```

Then you need to configure your DNS: until about two weeks ago I'd have told you to create an A record pointing the root domain at this Github IP address: _185.31.18.133_, but then I discovered that [CloudFlare](https://www.cloudflare.com) have some advanced voodoo they call [CNAME Flattening](http://blog.cloudflare.com/introducing-cname-flattening-rfc-compliant-cnames-at-a-domains-root/) which means that a root domain can be properly CNAMEd without breaking all your MX records, and now I don't know what to think. You should probably take a look, it's amazing.

So after committing, pushing, and waiting the requisite DNS-propagation-time (which seems to getting shorter and shorter, maybe it's just me, get off my lawn), your amazing site will be available at [http://bandname.com](http://bandname.com).

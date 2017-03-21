# Book us by pull-request

* Fork the repo
* Clone your fork
* Create a branch
* Create a markdown file here (in `gigs/_posts/`), named as `YYYY-MM-DD-this-bit-will-become-the-title.md`
* containing these fields:

```
---
location:    {whatever address}
time:        {24hr format, quoted because YAML}
price:       {optional, with currency symbol}
facebook_id: {optional, if you have an FB event}
latitude:    {where in the world}
longitude:   {is your place located?}
---
```

(The dashes top-and-bottom are __important__. See this [existing event](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs/_posts/2014-10-22-the-comedy.md) as a guide)

* `bundle`
* `jekyll serve`
* Look at [http://localhost:4000/gigs/](http://localhost:4000/gigs/)
* There should be a link to your event
* If that looks OK, push your branch and submit a PR onto our master

And then I guess we negotiate in the PR discussion and merge when everybody's happy

This will also embed JSON-LD in the event page:

```
<script type="application/ld+json">
[{
  "@context" : "http://schema.org",
  "@type" : "MusicEvent",
  "name" : "Raw Funk Maharishi live at The Comedy",
  "startDate" : "2014-10-22 00:00:00 +0000T20:00",
  "location" : {
    "@type" : "Place",
    "name" : "The Comedy",
    "address" : "The Comedy, Oxendon St, SW1"
  },
  "performer" : [{
    "@type" : "MusicGroup",
    "name" : "Raw Funk Maharishi",
    "sameAs" : "http://rawfunkmaharishi.uk/"
  }]
}]
</script>
```

because who doesn't like a bit of [Linked Data](http://rawfunkmaharishi.uk/blog/2015/01/19/linking-data/)?

Seriously, if you do this, you have a _very very good chance_ of us playing your show

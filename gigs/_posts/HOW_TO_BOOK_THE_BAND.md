#BOOK SOME LIVE MUSIC BY PULL-REQUEST

* Clone the repo
* Create a branch
* Create a YAML file here (in `gigs/_posts/`), named as:
  `YYYY-MM-DD-this-bit-will-become-the-title`
* containing these fields:

```
---
location:    {whatever address}
time:        {24hr format, quoted because YAML}
price:       {optional, with currency units}
facebook_id: {optional, if you have an FB event}
latitude:    {where in the world}
longitude:   {is your place located?}
---
```

(See this [existing event](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs/_posts/2014-10-22-the-comedy.yml) as a guide)

* `bundle`
* `jekyll serve`
* Look at http://localhost:4000/gigs/
* There should be a link to your event
* If that looks OK, push your branch and submit a PR onto our master

And then I guess we negotiate in the PR discussion and merge when everybody's happy

Seriously, if anybody does this, you have a _very very good chance_ of us playing your show

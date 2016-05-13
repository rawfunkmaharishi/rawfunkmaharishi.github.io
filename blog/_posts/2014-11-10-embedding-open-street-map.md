---
title: Embedding OpenStreetmap
---

This is a band site, which means it has [gig pages](http://rawfunkmaharishi.uk/gigs/), and a good [gig page](http://rawfunkmaharishi.uk/gigs/2014/12/04/buffalo-bar/) has an embedded map. We could use Google Maps, sure, but [OpenStreetMap](http://www.openstreetmap.org/) has a [much more appealing license](http://www.openstreetmap.org/copyright). So our choices are:

---

## UPDATE: I have [worked Leaflet out now](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/1e773ce14faaa79b2f4a8f5b180d3320040b2c7d/_includes/map.html), which possibly makes this all a bit redundant

But I'll leave it here just in case

---

## Embed the whole thing

My first move was just to locate the place in the browser, click 'share' on the right-hand-side, and paste the full HTML for the iframe into the [gig data](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs/_posts/HOW_TO_BOOK_THE_BAND.md). This works, but it's a really, really terrible solution. So then I looked at

## Leaflet.js

People tell me this is great, but what I know about JavaScript would fit on the back of a matchbox. I hacked around with it for a while and was unable to produce anything useful. If you can show me how to Leaflet, I am of course [accepting pull-requests](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/pulls), but pragmatism led me on towards

## My OpenLayers *_include* thing

I strapped on the bamboo headphones and Cargo-Culted my way to [this](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/map.html). I _kind of_ understand what it's doing, but some of it is still utterly impenetrable to me. The important thing, however, is that all of the ugliness is trapped in this one file, and we can generate an [embeddable map, complete with a pin](http://rawfunkmaharishi.uk/gigs/2014/12/04/buffalo-bar/), with just a [latitude and a longitude](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs/_posts/2014-12-04-buffalo-bar.md#L5-L6), which are easily extracted from an [OpenStreetMap URL](http://www.openstreetmap.org/#map=18/51.54610/-0.10330)

## How to use it

As you can see from [this](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_layouts/gig.html# L37-L39), you can embed a map with simple call like this:

{% raw %}
```
{% include map.html latitude = '51.49055' longitude = '-0.22406' %}
```
{% endraw %}

##Help yourself

All of the code driving this site is [MIT Licensed](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/LICENSE.md), so please feel free to use this *_include* file in your own Jekyll sites (or help me make it obsolete by replacing it with Leaflet!)

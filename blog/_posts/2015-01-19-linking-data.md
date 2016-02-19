Due to working at the [Open Data Institute](http://theodi.org), I sometimes cross paths with [Sir Tim Berners-Lee](https://www.w3.org/People/Berners-Lee/), and it was from him I learned that musicians are using [JSON-LD](http://json-ld.org/) to publish [Linked Data](http://linkeddata.org/) about their live performances.

## What does JSON-LD look like, then?

In the source of [this gig page](http://rawfunkmaharishi.uk/gigs/2015/01/15/nambucca/), you will find the following chunk of JSON:

{% raw %}
    <script type="application/ld+json">
    [{
      "@context" : "http://schema.org",
      "@type" : "MusicEvent",
      "name" : "Raw Funk Maharishi live at Nambucca",
      "startDate" : "2015-01-15T20:00",
      "location" : {
        "@type" : "Place",
        "name" : "Nambucca",
        "address" : "596 Holloway Road, London, N7"
      },
      "performer" : [{
        "@type" : "MusicGroup",
        "name" : "Raw Funk Maharishi",
        "sameAs" : "http://rawfunkmaharishi.uk/"
      }]
    }]
    </script>
{% endraw %}

which neatly describes the event. I [cargo-culted](http://en.wikipedia.org/wiki/Cargo_cult) most of this directly from [here](https://support.google.com/webmasters/answer/4620133?hl=en), but as far as I can tell, it's valid.

## Constructing the JSON blocks

This is a job for [yet another Jekyll *_include*](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/json-ld.html).

{% raw %}
    <script type="application/ld+json">
    [{
      "@context" : "http://schema.org",
      "@type" : "MusicEvent",
      "name" : "Raw Funk Maharishi live at {{ include.title }}",
      "startDate" : "{{ include.date | date: "%Y-%m-%d" }}T{{ include.time }}",
      "location" : {
        "@type" : "Place",
        "name" : "{{ include.title }}",
        "address" : "{{ include.location }}"
        },
        "performer" : [{
          "@type" : "MusicGroup",
          "name" : "Raw Funk Maharishi",
          "sameAs" : "http://rawfunkmaharishi.uk/"
      }]
    }]
    </script>
{% endraw %}

Then that gets called from [this layout](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_layouts/gig.html#L42) which already has all the relevant data, and because building with Jekyll is basically like sticking Lego bricks together, every gig page magically gets some Linked Data.

I guess one day this stuff will show up on the right-hand side of the page when you Google for us, like it does for [this guy](https://www.google.co.uk/search?q=squarepusher).

## Certified Open Data

Something else we've developed at the ODI is the [Open Data Certificate](https://certificates.theodi.org/), so of course I [got a certificate for this data](http://rawfunkmaharishi.uk/licensing/).

## Help yourself

All of the code driving this site is [MIT Licensed](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/LICENSE.md), so please feel free to use this *_include* file in your own Jekyll sites (or help me make it better!)

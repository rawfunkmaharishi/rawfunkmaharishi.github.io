---
priority: 3
---
We're building a static site, but that doesn't mean we're going to hard-code everything and construct all the pages by hand - Jekyll has excellent support for driving your content with data. Let's look at an example:

## Our Footer

The data for our site's footer is in *[_data/links.yml](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_data/links.yml)* and looks like this:

    - title:       Twitter
      url:         https://twitter.com/uncookedfunk
      fontawesome: fa-twitter

    - title:       Facebook
      url:         https://www.facebook.com/rawfunkmaharishi
      fontawesome: fa-facebook-square

    - title:       Soundcloud
      url:         https://soundcloud.com/rawfunkmaharishi
      fontawesome: fa-soundcloud

Those titles, URLs and [font-awesome](http://fortawesome.github.io/Font-Awesome/icons/) icons are exposed as _site.data.links[0].title_ and so on, and we can iterate through them in *[_includes/footer.html](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/footer.html)* with something like

{% raw %}
    {% for link in site.data.links %}
      <a href='{{ link.url }}' title='{{ link.title }}'>
        <i class='fa {{ link.fontawesome }}'></i>
        <span class='hidden-xs'> {{ link.title }}</span>
      </a>
    {% endfor %}
{% endraw %}

Building a footer or a navigation bar this way is all very well, but what about entirely data-driven blog posts? Well, those [sets of three dashes](http://rawfunkmaharishi.uk/blog/2014/11/11/getting-started-with-jekyll/#create-some-content) that we have at the top of each content page are delimiters for [Jekyll front matter](http://jekyllrb.com/docs/frontmatter/), where we normally specify things like titles and layouts. However, it's just YAML, and we can put anything we want in there. Which led me to the idea of

## Data-driven gigs

Take a look at [this](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs/_posts/2014-12-04-buffalo-bar.md):

    ---
    location:    259 Upper St, London, N1
    time:        '20:30'
    facebook_id: 1554796168085840
    latitude:    51.5461216
    longitude:   -0.1032551
    ---

That's all the data we need to describe a Raw Funk Maharishi gig (or at least it is for now, it would be trivially easy to support other fields for EventBrite or whatever). Jekyll rummages through our site, looking for any files within *_posts/* directories and rendering them as pages - it also parses the filenames to give us a nice _/YYYY/MM/DD/title-slug/_ URL, as well as _page.date_ and _page.title_ - and because of [this bit](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_config.yml#L9-L16) in *_config.yml* it defaults to using the [gig layout](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_layouts/gig.html),
which has access to those items via _page.location_, etc:

{% raw %}
    <dl class='dl-horizontal'>

      <dt>Date<dt>
      <dd>{{ page.date | date_to_long_string }}</dd>

      <dt>Time</dt>
      <dd>{{ page.time }}</dd>

      <dt>Location</dt>
      <dd>{{ page.location }}</dd>

      {% if page.price %}
        <dt>Price</dt>
        <dd>{{ page.price }}</dd>
      {% endif %}

      {% if page.facebook_id %}
        <dt>More info</dt>
        <dd>
          <a href='https://facebook.com/events/{{ page.facebook_id }}/' title='Facebook event'>
            Facebook
          </a>
        </dd>
      {% endif %}

    </dl>
{% endraw %}

and of course _page.latitude_ and _page.longitude_ with which it [renders an OSM map](http://rawfunkmaharishi.uk/blog/2014/11/10/embedding-open-street-map/).

This data is also exposed as _site.categories.gigs_ - the hash key there is the directory under which our *_posts* appear, we also have _site.categories.blog_ on this site, as well as all *_posts* as _site.posts_ - which we can [iterate through to construct an archive page](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/gigs.html#L22-L32).

I have a nagging feeling that this might be a misuse of tools (a gig is not really a blog post), but I'm still feeling my way around Jekyll and this works just fine for now.

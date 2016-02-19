A band site needs music, right? We have a load of tracks up on [SoundCloud](https://soundcloud.com/rawfunkmaharishi), and they make [embedding](http://rawfunkmaharishi.uk/sounds/) pretty easy. The default embeddable iframe is pretty bloody ugly, though:

    <iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/174628735&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>

So, armed with my vanishingly small armoury of JavaScript skills, I set about looking for a more elegant solution.

## oEmbed

According to [this page](https://developers.soundcloud.com/docs/oembed), _oEmbed is an open standard to easily embed content from oEmbed providers into your site_, which seems to be _exactly_ what we're after. So I lashed together [this include](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/oembed-sound.html) from various bits and pieces I found around the place:

{% raw %}
    <div class='col-md-{{ include.width }}'>
      <div class='thumbnail'>
        <div class='embed-responsive embed-responsive-16by9'
             id='player-{{ include.id }}'></div>
      </div>
    </div>

    <!-- More John Frum action -->
    <script>
      $(document).ready(function() {
        SC.get(
          '/tracks/{{ include.id }}',
          function(track) {
          SC.oEmbed(
            track.permalink_url,
            document.getElementById('player-{{ include.id }}')
          );
        });
      });
    </script>
{% endraw %}

and do you know what? IT ACTUALLY WORKED. Yes, I was as surprised as anyone. You can see it in action [here](http://rawfunkmaharishi.uk/oembed-sounds/).

## I do not think this word means what you think it means

Except it didn't quite work properly. It was all good on my desktop browsers, and it responded properly when I squished Chrome down to phone-size, but on an actual phone, NOTHING. We tried it on Android Chrome, the default Android Webkit browser, and on an iPhone, and those iframes refused to show their faces.

Until I forced my Android browsers to 'Request Desktop Site', and then everything worked as expected.

I contacted SoundCloud about this, and while they were very nice, their response was basically 'The API is working as expected', which I guess is true. I can only conclude that this is some horrible nexus of Flash, HTML5 and User-Agents, and life is too short to dig into that, so I hacked together another [awesome include](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/sound.html) to tidy up the horror show and contain it all in one place:

{% raw %}
    {% assign auto_play = false %}
    {% assign hide_related = true %}
    {% assign show_comments = false %}
    {% assign show_user = false %}
    {% assign show_reposts= false %}
    {% assign visual = true %}

    {% assign url = 'https://w.soundcloud.com/player/' %}

    {% capture url %}{{ url | append:'?url=https%3A//api.soundcloud.com/tracks/' }}{% endcapture %}
    {% capture url %}{{ url | append:include.id }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;auto_play=' }}{% endcapture %}
    {% capture url %}{{ url | append:auto_play }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;hide_related=' }}{% endcapture %}
    {% capture url %}{{ url | append:hide_related }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;show_comments=' }}{% endcapture %}
    {% capture url %}{{ url | append:show_comments }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;show_user=' }}{% endcapture %}
    {% capture url %}{{ url | append:show_user }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;show_reposts=' }}{% endcapture %}
    {% capture url %}{{ url | append:show_reposts }}{% endcapture %}

    {% capture url %}{{ url | append:'&amp;visual=' }}{% endcapture %}
    {% capture url %}{{ url | append:visual }}{% endcapture %}

    <iframe class='embed-responsive-item' src={{ url }}></iframe>
{% endraw %}

Yes, I realise that this is still pretty unwieldy, but [Liquid](http://liquidmarkup.org/) seems to have a grudge against elegant string-building (or I've missed something). Whatever, you can feed this with the _id_ of a SoundCloud track:

{% raw %}
    {% include sound.html id = '173701811' %}
{% endraw %}

and get back a nice embeddable iframe _which seems to work everywhere_. (Incidentally, I've only been able to find the track id buried in the embed iframe line from SoundCloud, am I missing something else?).

## Help yourself

All of the code driving this site is [MIT Licensed](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/LICENSE.md), so as with the [OpenStreetMap embed](http://rawfunkmaharishi.uk/blog/2014/11/10/embedding-open-street-map/), please feel free to use this *_include* file in your own Jekyll sites (or help me make it redundant by showing me how I'm misunderstanding oEmbed!)

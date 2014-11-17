---
layout: blost
---

We have a load of tracks up on [SoundCloud](https://soundcloud.com/rawfunkmaharishi), and they make [embedding](http://rawfunkmaharishi.uk/sounds/) pretty easy. The default embeddable iframe is pretty bloody ugly, though:

    <iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/174628735&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>

so, armed with my vanishingly small armoury of JavaScript skills, I set about looking for a more elegant solution.

##oEmbed

According to [this page](https://developers.soundcloud.com/docs/oembed), _oEmbed is an open standard to easily embed content from oEmbed providers into your site_, which seems to be _exactly_ what we're after. So I lashed together [this include](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/oembed-sound.html) from various bits and pieces I found around the place:

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

and do you know what? IT ACTUALLY WORKED. Yes, I was as surprised as anyone. You can see it in action [here](http://rawfunkmaharishi.uk/oembed-sounds/).

##What do you mean by 'working'?

Except it didn't quite work properly. It was all good on my desktop browsers, and it responded properly when I squished Chrome down to phone-size, but on an actual phone, NOTHING. We tried it on Android Chrome, the default Android Webkit browser, and on an iPhone, and those iframes refused to show their faces.

Until I forced my Android browsers to 'Request Desktop Site', and then everything worked as expected.

I contacted SoundCloud about this, and while they were very nice, their response was basically 'The API is working as expected', which I guess is true. I can only conclude that this is some horrible nexus of Flash, HTML5 and User-Agents, and life is short, so I hacked together another [awesome include](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/sound.html) to tidy up the horror show and contain it all in one place:

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

    <div class='col-md-{{ include.width }}'>
      <div class='thumbnail soundcloud'>
        <div class='embed-responsive embed-responsive-16by9'>
          <iframe class='embed-responsive-item'
                  src={{ url }}>
          </iframe>
        </div>
      </div>
    </div>
{% endraw %}

Yes, I realise that this is pretty unwieldy, but a lot of that is down to the limitations of [Liquid](http://liquidmarkup.org/). Whatever, this 

---
---

I am mildly bewildered by SoundCloud embeds. I have [this page](http://rawfunkmaharishi.uk/sounds/) on my band's (Github-hosted) site. Right now, it's using [this hacked-together thing](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/hacky-sound.html) to embed those tracks, which is a bit inelegant but works on _everything_ I've tried it on, including various phone browsers.

In an attempt to create a more beautiful solution, I tried using the oEmbed endpoint with [this](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_includes/sound.html) (with the initializer [here](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/sounds.html#L5-L10)) which works fine on my desktop browsers, and in Chrome on my Android phone. But on other phone browsers none of the tracks get rendered, _unless I request the desktop version_, which makes it all work fine (at least on the Android browser, I've had semi-confirmed reports of it working on iPhones too). See it in action [here](http://rawfunkmaharishi.uk/oembed-sounds/).

I'm presuming this is all some horrible nexus of User-agents, HTML5 and Flash, and maybe I'm doing something dumb (I'm cargo-culting most of this JavaScript stuff) but is there a nice way out of this?

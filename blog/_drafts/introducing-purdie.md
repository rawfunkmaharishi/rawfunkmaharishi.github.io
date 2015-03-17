---
layout: blost
---
We have [music](/sounds/) on [SoundCloud](https://soundcloud.com/rawfunkmaharishi), [photos](/pictures/) on [Flickr](https://www.flickr.com/photos/rawfunkmaharishi/), and [videos](/videos/) on [Vimeo](https://vimeo.com/rawfunkmaharishi), and if we create a [YAML representation](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_data/soundcloud.yaml) of those assets then Jekyll can render them.

Up until now I've been crafting those YAML files by hand, which is tedious and error-prone, and generally kinda dumb. But it's 2015, and everything has a REST(ish) API, so let's make a robot to do this for us!

##Using URLs as Tim intended

Given a URL for an asset, we should be able to extract all of the metadata about that asset via the APIs. So instead of maintaining whole YAML files (with lots of repetition and redundancy), our asset management is reduced to keeping [lists of URLs](https://github.com/rawfunkmaharishi/rawfunkmaharishi.github.io/blob/master/_sources/soundcloud.csv):

    https://soundcloud.com/rawfunkmaharishi/bernard
    https://soundcloud.com/rawfunkmaharishi/junalbandi-3
    https://soundcloud.com/rawfunkmaharishi/beer-of-course-but-why
    https://soundcloud.com/rawfunkmaharishi/hexaflexagon-1

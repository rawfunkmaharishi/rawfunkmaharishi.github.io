#!/usr/bin/env ruby

# This is heavy cruft but I cannot use a Flickr plugin on gh-pages, and anyway
# what about my API secret?

require 'flickraw'
require 'dotenv'
require 'yaml'

Dotenv.load

FlickRaw.api_key = ENV['FLICKR_API_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SECRET']

licenses = flickr.photos.licenses.getInfo

yaml = File.open '_data/pictures.yml', 'w'

l = []

f = flickr.photosets.getPhotos(photoset_id: ENV['FLICKR_ALBUM_ID'])
f['photo'].each do |p|
  h = {}

  data = flickr.photos.getInfo(photo_id: p['id'])
  h['photo_page'] = data['urls'][0]['_content']
  h['title'] = data['title']
  h['photo_url'] = FlickRaw.url_m(p)

  license = licenses.select {|l| l['id'] == data['license']}[0]
  h['license'] = license['name'].split(' License')[0]
  h['license_url'] = license['url']

  data['tags'].each do |tag|
    if tag['raw'].match('photographer')
      h['photographer'] = tag['raw'].split(':')[1]
    end
  end

  l << h
end

yaml.write l.to_yaml
yaml.close

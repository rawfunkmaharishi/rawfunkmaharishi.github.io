#!/usr/bin/env ruby

require 'flickraw'
require 'dotenv'
require 'yaml'

Dotenv.load

FlickRaw.api_key = ENV['FLICKR_API_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SECRET']

yaml = File.open '_data/pictures.yml', 'w'

l = []

f = flickr.photosets.getPhotos(photoset_id: ENV['FLICKR_ALBUM_ID'])
f['photo'].each do |p|
  h = {}

  data = flickr.photos.getInfo(photo_id: p['id'])
  h[:photo_page] = data['urls'][0]['_content']
  h[:title] = data['title']
  h[:photo_url] = FlickRaw.url_m(p)

  data['tags'].each do |tag|
    if tag['raw'].match('photographer')
      h[:photographer] = tag['raw'].split(':')[1]
    end
  end

  l << h
end

yaml.write l.to_yaml
yaml.close

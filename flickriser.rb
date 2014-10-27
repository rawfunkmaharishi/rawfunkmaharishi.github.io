#!/usr/bin/env ruby

require 'flickraw'
require 'dotenv'
require 'yaml'

Dotenv.load

FlickRaw.api_key = ENV['FLICKR_API_KEY']
FlickRaw.shared_secret = ENV['FLICKR_SECRET']

yaml = File.open '_data/pictures.yml', 'w'

f = flickr.photosets.getPhotos(photoset_id: ENV['FLICKR_ALBUM_ID'])

f['photo'].each do |p|
  h = {}

  data = flickr.photos.getInfo(photo_id: p['id'])
  h[:photo_page] = data['urls'][0]['_content']
  h[:title] = data['title']
  h[:photo_url] = FlickRaw.url(p)

  yaml.write h.to_yaml
end

yaml.close

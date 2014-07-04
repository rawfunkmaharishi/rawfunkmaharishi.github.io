require 'sinatra/base'
require 'haml'
require 'rack-google-analytics'

class SoundcloudPlaylistEmbed
  def initialize list_id
    @list_id = list_id
    @width = 100
    @height = 300
  end

  def to_s
    s = ''
    s << '<iframe frameborder="no" height="'
    s << @height.to_s
    s << '" scrolling="no" src="'
    s << 'https://w.soundcloud.com/player/?'
    s << 'url=https%3A//api.soundcloud.com/playlists/'
    s << @list_id.to_s
    s << '&amp;amp;color=ff5500&amp;amp;auto_play=false&amp;amp;'
    s << 'hide_related=false&amp;amp;show_comments=true&amp;amp;'
    s << 'show_user=true&amp;amp;show_reposts=false"'
    s << ' width="'
    s << @width.to_s
    s << '%"></iframe>'

    s
  end
end

class RawFunkMaharishi < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-52131829-1'
  get '/' do

    title = "Raw Funk Maharishi"

    haml :index, :locals => {
        :title => title,
        :embed => SoundcloudPlaylistEmbed.new(41994900).to_s
    }
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end

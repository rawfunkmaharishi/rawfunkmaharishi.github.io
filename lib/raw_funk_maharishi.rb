require 'sinatra/base'
require 'haml'
require 'rack-google-analytics'

class RawFunkMaharishi < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-52131829-1'
  get '/' do

    title = "Raw Funk Maharishi"

    haml :index, :locals => {
        :title => title
    }
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end

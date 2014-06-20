require 'sinatra/base'
require 'haml'

class RawFunkMaharishi < Sinatra::Base

  get '/' do

    title = "Raw Funk Maharishi"

    haml :index, :locals => {
        :title => title
    }
  end

# start the server if ruby file executed directly
  run! if app_file == $0
end

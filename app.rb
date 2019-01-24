require 'sinatra/base'

class Birthday < Sinatra::Base
  get '/' do
    "Hello how you doin"
  end

  run! if app_file == $0
end

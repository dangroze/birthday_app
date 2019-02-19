require 'sinatra/base'

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/details" do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]

    @day = @day.to_i
    @month = @month.to_i

    start_date = DateTime.now
    end_date = DateTime.new(DateTime.now.year, @month, @day)
    if start_date > end_date
      end_date = DateTime.new(DateTime.now.year + 1, @month, @day)
    end
    @difference = (start_date..end_date).count

    erb(:play)
  end

  run! if app_file == $0
end

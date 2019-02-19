require 'sinatra/base'
require 'time_difference'

class Birthday < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/details" do
    session[:name] = params[:name]
    session[:date] = params[:date]
    session[:month] = params[:month]
    redirect '/play'
  end

  get '/play' do
    @name = session[:name]
    @date = session[:date]
    @month = session[:month]

    @time = Time.new
    @birthday = Time.new(2019, @month, @date)
    @month_now = @time.month
    @day = @time.day
    @difference = (TimeDifference.between(@time, @birthday).in_days).ceil

    erb(:play)
  end

  run! if app_file == $0
end

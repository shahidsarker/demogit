require 'sinatra/activerecord'
require 'sinatra'
require './models'

set :database, adapter: 'sqlite3', database: 'doggly.sqlite3'
enable :sessions

get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    redirect '/profile'
  else
    redirect '/'
  end

  p params
end

get '/profile' do
  erb :profile
end

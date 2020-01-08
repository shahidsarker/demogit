# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra'
require './models'

# set :database, adapter: 'sqlite3', database: 'doggly.sqlite3'
set :database, { adapter: 'postgresql', 
                 database: 'doggly',
                 username: 'postgres',
                 password: ENV['POSTGRES_PW']
                }
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

require 'sinatra/activerecord'
require 'sinatra'
require './models'

configure :development do
  set :database, adapter: 'postgresql',
               database: 'doggly',
               username: 'postgres',
               password: ENV['POSTGRES_PW']
end

configure :production do
  set :database, {url: ENV['DATABASE_URL']}
end


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

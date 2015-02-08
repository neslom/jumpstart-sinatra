require 'sinatra'
require 'sinatra/reloader'
require 'sass'
require './song'

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

set :session_secret, 'this is long and hard to guess'

get '/login' do
  erb :login
end

post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    redirect to('/songs')
  else
  erb :login
  end
end

get '/logout' do
  session.clear
  redirect to('/login')
end

get('/styles.css') { scss :styles }

get '/' do
  erb :home
end

get '/about' do
  @title = "All About This Website"
  erb :about
end

get '/contact' do
  @title = "Contact Lenses"
  erb :contact
end

not_found do
  @title = "EHHH"
  erb :not_found, :layout => :error_layout
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "Hello #{session[:name]}"
end

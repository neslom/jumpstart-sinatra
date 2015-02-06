require 'sinatra'
require 'sinatra/reloader'
require 'sass'
require './song'

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

error do
  "Sorry there was a bitchy error - " + env['sinatra.error'].name
end

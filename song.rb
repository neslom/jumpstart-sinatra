require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Song
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :lyrics, Text
  property :length, Integer
  property :released_on, Date
end

DataMapper.finalize

get '/songs' do
  @songs = Song.all
  erb :songs
end

get '/songs/:id' do
  @song = Song.get(params[:id])
  erb :show_song
end

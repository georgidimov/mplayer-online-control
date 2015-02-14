require 'json'
require_relative '../lib/file_manager'

get '/run' do
  Player.run(settings.socket_location)
  CommandParser.run(settings.socket_location)

  redirect '/'
end

get '/kill' do
  Player.stop
end

get '/' do 
  erb :base
end

post '/pause' do
  CommandParser.pause
end

post '/play' do
  json = request.body.read
  song_name = JSON.parse(json)["name"]
  song_name = song_name.gsub(' ', '\ ')
  path      = settings.source_folder.gsub(' ', '\ ')
  CommandParser.play(path, song_name)
end

post '/stop' do
  CommandParser.stop
end

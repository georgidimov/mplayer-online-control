require 'json'
require_relative '../lib/file_manager'

get '/run' do
  Player.run(settings.socket_location)
  CommandParser.run(settings.socket_location)

  redirect '/'
end

get '/kill' do
  Player.stop
  halt
end

get '/' do
  erb :base
end

post '/pause' do
  CommandParser.pause
end

post '/play' do
  received_string = request.body.read
  song_name = JSON.parse(received_string)["name"]
  song_name = song_name.gsub(' ', '\ ')

  path      = settings.source_folder.gsub(' ', '\ ')

  if Directory.contain?(path + '\\' + song_name)
    CommandParser.play(path, song_name + '.mp3')
  end
end

post '/stop' do
  CommandParser.stop
end

post '/volume_up' do
  CommandParser.volume_up
end

post '/volume_down' do
  CommandParser.volume_down
end

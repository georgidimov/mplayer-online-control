require 'json'

get '/run' do
  source_file = '/tmp/mplayer_socket'
  Player.run(source_file)
  CommandParser.run(source_file)

  redirect '/'
end

post '/kill' do
  Player.stop
end

get '/' do
  erb :base
end

post '/play' do
  json = request.body.read
  song_name = JSON.parse(json)["name"]
  song_name = song_name.gsub(' ', '\ ')
  puts song_name
  CommandParser.play('/home/georgi/Music/last\ added', song_name)
end

post '/stop' do
  CommandParser.stop
end

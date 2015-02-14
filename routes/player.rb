get '/run' do
  source_file = '/tmp/mplayer_socket'
  Player.run(source_file)
  CommandParser.run(source_file)
end

get '/kill' do
  Player.stop
end

get '/' do
  erb :base
end

get '/play' do
  CommandParser.play('/tmp', 'test.mp3')
end

get '/stop' do
  CommandParser.stop
end

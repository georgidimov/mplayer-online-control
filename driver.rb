class Player
  def initialize(passed_socket_location)
    @socket_location = passed_socket_location
    @player_process_id = start_player
  end

  def create_socket
    process_id = fork do
      system "mkfifo #{@socket_location}"
    end

    Process.wait(process_id)
  end

  def start_player
    create_socket

    player_id = Process.spawn "mplayer -idle -input file=#{@socket_location}"
    player_id
  end

  def stop_player
    system "kill #{@player_process_id}"
    delete_socket
  end

  def delete_socket
    system "rm #{@socket_location}"
  end

  private :create_socket, :delete_socket
end

class CommandParser
  def initialize(passed_socket_location)
    @socket_location = passed_socket_location
  end

  def play(song_location = '', song_name)
    command = "loadfile #{song_location}/#{song_name}"
    execute command
  end

  def pause
    execute 'pause'
  end

  def stop
    execute 'stop'
  end

  def loop
    execute 'loop 0'
  end

  def volume_up
    execute 'volume +10'
  end

  def volume_down
    execute 'volume -10'
  end

  def execute(command)
    system "echo \"#{command}\" > #{@socket_location}"
  end
  private :execute
end
location = '/tmp/mplayer_socket'
song_location = '/tmp'
song_name = 'test.mp3'
p = Player.new(location)
c = CommandParser.new(location)
c.play(song_location, song_name)
sleep(10)
p.stop_player
#system("echo \"loadfile /tmp/test.mp3\" > /tmp/mplayer_socket")
#sleep(10)

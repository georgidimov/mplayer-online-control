class Player
  def initialize(passed_socket_location = nil)
    unless passed_socket_location.nil?
      @socket_location = passed_socket_location
    else
      @socket_location = '/tmp/mplayer_socket'
    end

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

p = Player.new
sleep(2)
system("echo \"loadfile /tmp/test.mp3\" > /tmp/mplayer_socket")
sleep(10)
p.stop_player

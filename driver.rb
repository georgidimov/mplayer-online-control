class PlayerDriver
  def initialize
    @socket_location = '/tmp/mplayer_socket'
    @player_process = start_player
  end
  
  def create_socket
    pid = fork do
      system "mkfifo #{@socket_location}"
    end
    
    pid
  end

  def start_player
    Process.wait(create_socket)
    
    pid = fork do
      system "mplayer -idle -input file=#{@socket_location}" 
    end

    Process.wait(pid)
    delete_socket
  end

  def stop_player
    system "echo \"quit\" > /tmp/mplayer_socket"
    delete_socket
  end

  def delete_socket
    system " rm #{@socket_location}"
  end
end


driver = PlayerDriver.new
#driver.start_player

#driver.stop_player
#driver.delete_socket
#driver.delete_socket
#s = UNIXServer.new('/tmp/s')
#s.close


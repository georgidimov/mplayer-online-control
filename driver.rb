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
    
    pid = Process.spawn "mplayer -idle -input file=#{@socket_location}" 

    pid
  end

  def stop_player
    system "kill #{@player_process}"
    puts "killed #{@player_process}"
    delete_socket
  end

  def delete_socket
    system "rm #{@socket_location}"
    puts "Deleted!"
  end

  def f
    puts "hohoh!"
  end
end


driver = PlayerDriver.new
sleep(1)
driver.f
sleep(7)
driver.f
driver.stop_player
#driver.start_player

#driver.stop_player
#driver.delete_socket
#driver.delete_socket
#s = UNIXServer.new('/tmp/s')
#s.close


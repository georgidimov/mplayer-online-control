class Player
  def self.run(passed_socket_location)
    @@socket_location   = passed_socket_location
    @@player_process_id = start_player
  end

  def self.stop
    stop_player
  end

  def self.create_socket
    process_id = fork do
      system("mkfifo #{@@socket_location}")
    end

    Process.wait(process_id)
  end

  def self.start_player
    create_socket

    player_id = Process.spawn("mplayer -idle -input file=#{@@socket_location}")
    player_id
  end

  def self.stop_player
    system("kill #{@@player_process_id}")
    delete_socket
  end

  def self.delete_socket
    system("rm #{@@socket_location}")
  end

  private_class_method :create_socket, :delete_socket
  private_class_method :start_player,  :stop_player
end

class CommandParser
  def self.run(passed_socket_location)
    @@socket_location = passed_socket_location
  end

  def self.execute(command)
    system("echo \"#{command}\" > #{@@socket_location}")
  end

  def self.play(song_location = '', song_name)
    command = "loadfile #{song_location}/#{song_name}"
    execute(command)
  end

  def self.pause
    execute('pause')
  end

  def self.stop
    execute('stop')
  end

  def self.loop
    execute('loop 0')
  end

  def self.volume_up
    execute('volume +10')
  end

  def self.volume_down
    execute('volume -10')
  end
 private_class_method :execute
end

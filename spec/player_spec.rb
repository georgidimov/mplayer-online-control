describe 'Player' do
  let(:socket_location){ '/tmp/tmp_socket'           }
  let(:player)         { Player.new(socket_location) }

  context 'sockets' do
    it 'create socket on the right place' do
      player
      expect(File.exist?(socket_location)).to eq true
      player.stop_player
    end

    it 'remove socket after finish' do
      player.stop_player
      expect(File.exist?(socket_location)).to eq false
    end
  end
=begin
  let(:player_name){ 'mplayer' }
  context 'player process' do
    it 'run player process' do
      player_id = fork do
        player
      end
      Process.waitpid(player_id)
      expect(`ps aux | grep mplayer`.lines.count).to eq 1
      player.stop_player
    end
=end
=begin
    it 'stop player procces' do
      player
      player.stop_player
      grep_output = %x[ps aux | grep player_name]
      expect(grep_output.lines.count).to eq 1
      puts grep_output
    end
  end
=end
end

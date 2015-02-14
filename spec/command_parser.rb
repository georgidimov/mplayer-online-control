require 'fifo'
describe 'CommandParser' do
  let(:socket_location){ '/tmp/tmp_socket'                  }
  let(:command_parser) { CommandParser.new(socket_location) }
  context 'send commands to the socket' do
    it 'play songs ' do
      system("mkfifo #{socket_location}")
      command_parser
      
      fifo = Fifo.new(socket_location)

      command = fifo.readline
      sleep(1)
      command_parser.play('/myDir', 'myFavSong.mp3')

      expect(command).to eq "loadfile /myDir/myFavSong.mp3\n"

      system("rm #{socket_location}")
    end
  end
end

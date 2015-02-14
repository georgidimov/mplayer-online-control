require 'sinatra'
require 'sinatra/json'
require 'sinatra/config_file'
require_relative 'lib/real_player'
require_relative 'routes/player'
require_relative 'lib/file_manager'

config_file 'config/config.yml'

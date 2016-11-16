require 'sinatra'
require 'byebug'
require 'sinatra/activerecord'
require './config/environments'
require './models/user'
require './models/translation'


module Sinatra
  class Server < Sinatra::Base
    get "/" do
      @translation = Translation.all
      erb :index
    end
  end
end

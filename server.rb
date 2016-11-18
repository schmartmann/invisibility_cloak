require 'sinatra'
require 'byebug'
require 'sinatra/activerecord'
require './config/environments'
require './models/user'
require './models/translation'


module Sinatra
  class Server < Sinatra::Base
    get "/" do

      def html_breaker(html)
        tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
        nbspsRegExp = /(&nbsp;)/
        jsRegExp = /(function.*?})/
        @regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp)
        @text_arr = html.split(@regex)
      end

      translation = Translation.all
      @translation = []
      translation.each do |line|
        @translation.push(
          {
            content: html_breaker(line[:content])
          }
        )
      end
      byebug
      erb :index
    end
  end
end

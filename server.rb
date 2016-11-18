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

      # @translation = Translation.all


      translation = [
        {:id=>"TextBlock",
         :raw_text=>
          "<span style=\"font-size: 16px;\"><strong><span style=\"font-size: 18px;\"><span style=\"color: rgb(31, 73, 125);\">Goals</span><br /></span></strong></span><span style=\"color: rgb(0, 0, 0); font-size: 16px;\"><span style=\"font-size: 22px;\">&nbsp;&nbsp;&nbsp; •&nbsp;</span>Ensure&nbsp;that the Non-management&nbsp;Assessment is an effective predictor of job performance.<br /><span style=\"font-size: 22px;\">&nbsp; &nbsp; • </span>Ensure the selection tool is fair.<br /><span style=\"font-size: 22px;\">&nbsp; &nbsp; •</span>&nbsp;Provide legal defensibility for the selection system if it is ever challenged.</span>"},
          {:id=>"TextBlock",
           :raw_text=>
            "<span style=\"color: rgb(31, 73, 125); font-size: 18px;\"><strong>Purpose of Performance Evaluation Ratings</strong></span><br /><span style=\"color: rgb(0, 0, 0); font-size: 16px;\"><span style=\"font-size: 22px;\">&nbsp; &nbsp; •</span> Performance ratings collected are for <strong>RESEARCH AND DEVELOPMENT PURPOSES ONLY&nbsp;</strong>for the creation of a new assessment tool.<br /><span style=\"font-size: 22px;\">&nbsp; &nbsp; •</span> Performance ratings will&nbsp;<strong>NOT</strong><strong>&nbsp;</strong>be used to make any employment decisions.<br /><span style=\"font-size: 22px;\">&nbsp; &nbsp; •</span> Associates will <strong>NOT</strong><strong>&nbsp;</strong>receive any information regarding the performance ratings of any individual.<br /><span style=\"font-size: 22px;\">&nbsp; &nbsp; •</span>&nbsp;Only summary (non-identifiable) results will be reported.<br /></span>&nbsp;"}
      ]
      @translation = []
      translation.each do |line|
        @translation.push(
          {
            content: html_breaker(line[:raw_text]),

          }
        )
      end
      erb :index
    end
  end
end

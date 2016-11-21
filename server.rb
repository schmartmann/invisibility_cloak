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

      # translation = Translation.all

      translation = [
        {
          content:'<div><span style="font-family:arial">Dear&nbsp;{Candidate.FullName}:<br /> <br /> {Referrer.FirstName} {Referrer.LastName} thinks you might be a great addition to&nbsp;{Requisition.UDF_Company Name}&nbsp;and has just referred you for the position of {Requisition.JobTitle}&nbsp;- {Requisition.Number}.<br /> <br /> By referring you, {Referrer.FirstName}&nbsp;has initiated an online candidate profile on your behalf.&nbsp; If you are interested in a position with {Requisition.UDF_Company Name}, please review your online candidate profile and provide any additional information to ensure that our records are up to date.</span></div> <div>&nbsp;</div> <div><span style="font-family:arial">You can review your candidate profile by clicking on the link below and using the access code shown below.&nbsp;</span></div> <div>&nbsp;</div> <div><span style="font-family:arial">To accesss your candidate profile, <a href="{CareerSection.ChangePasswordUrl}">click here</a>.<br /> Access Code: {Candidate.SecurityCode}<br /> <br /> Best Regards,</span></div> <div><span style="font-family:arial">The Recruiting Team&nbsp;<br /> {Requisition.UDF_Company Name}</span></div>',
          category: "TextBlock"
        },
        {
          content: '<p class="p1" style="margin-top: 0px; margin-bottom: 0px;"><br /> </p> <p class="p1" style="margin-top: 0px; margin-bottom: 0px;"><em>Hey! Before you hit reply, you&#39;re receiving this email from one of our unmonitored mailboxes. Although we do love chatting with job seekers like yourself, please hop over to one of our social channels and chat with us directly. We don&#39;t monitor this mailbox often and we&#39;d hate to miss your email!</em></p> <p class="p2" style="margin-top: 0px; margin-bottom: 0px;"><br /> </p> <p class="p3" style="margin-top: 0px; margin-bottom: 0px;"><span class="s1"><a href="http://www.facebook.com/marriottjobsandcareers">Facebook</a></span> <span class="s2">| <a href="https://www.youtube.com/user/MarriottJobs"><span class="s1">YouTube</span></a> | <a href="http://www.twitter.com/marriottcareers"><span class="s1">Twitter</span></a> | <a href="http://www.linkedin.com/company/marriott-international"><span class="s1">LinkedIn</span></a> | <a href="http://www.weibo.com/marriottcareers"><span class="s1">Weibo</span></a> | <a href="http://www.instagram.com/marriottcareers"><span class="s1">Instagram</span></a></span></p> <p style="margin-top: 0px; margin-bottom: 0px;">&nbsp;</p>',
          category: 'TextBlock'
        },
        {
          content: '<p style="MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px">&nbsp;</p> <em>Marriott International is an equal opportunity employer committed to hiring a diverse workforce and sustaining an inclusive culture. Marriott International does not discriminate on the basis of disability, veteran status or any other basis protected under federal, state or local laws.</em>',
          category: 'TextBlock'
        }
      ]

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

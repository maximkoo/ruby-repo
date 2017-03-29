require 'net/http'
require 'openssl'
require 'nokogiri'
require './memefy.rb'

class Slogen
	def initialize

	end;

	def getXML
		url = URI.parse('https://slogen.servx.ru/server.php?nocache=1481112661902&slogan='+URI.encode("Пицца"))
		http=Net::HTTP.new(url.host, url.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		req=Net::HTTP::Get.new(url.request_uri)
		res=http.request(req)
		#puts res.body
		res.body
	end;	

	# def readXML
	# 	data=URI.parse('https://slogen.servx.ru/server.php?nocache=1481112661902&slogan=Pizza').read;
	# end;	

	def getSlogan(xmlText)
		doc=Nokogiri::XML(xmlText);
		doc.xpath('//report/comment/text()');
	end;

	def smishno(pic, line1, line2)
		Meme.new(pic, line1, line2).generate;
	end;	

	def divideSlogan(slogan)
		x=slogan.split.size.fdiv(2).ceil
		lines=slogan.split.each_slice(x).map{|a| a.join(' ')}
		lines
	end;	
end;

q=Slogen.new
sloganXML=q.getXML
puts sloganXML
slogan=q.getSlogan(sloganXML)
puts slogan
lines=q.divideSlogan(slogan.to_s)
q.smishno(ARGV[0], lines.first, lines.last)


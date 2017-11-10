require 'net/http'
require 'openssl'
require 'nokogiri'
require 'json'

class Slogen
	def initialize

	end;

	def getJSON
		url = URI.parse('https://wex.nz/api/3/ticker/nvc_usd')
		http=Net::HTTP.new(url.host, url.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		req=Net::HTTP::Get.new(url.request_uri)
		res=http.request(req)
		#puts res.body
		res.body
	end;	

	def getLast(jsonText)
		jsonHash=JSON.parse(jsonText)["nvc_usd"]["last"]
	end;

end;

q=Slogen.new
sloganJSON=q.getJSON
puts sloganJSON
#puts q.getSlogan(sloganJSON)
puts q.getLast(sloganJSON)

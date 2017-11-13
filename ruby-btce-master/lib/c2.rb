require 'json'
require 'monkey-patch'
require 'net/http'
require 'net/https'
require 'openssl'
require 'uri'
require 'yaml'

class Slogen
	def initialize

	end;

	def get_https(opts={})
		url = URI.parse('https://wex.nz/api/3/ticker/btc_usd')
		http=Net::HTTP.new(url.host, url.port)
		http.use_ssl=true
		http.verify_mode=OpenSSL::SSL::VERIFY_NONE
		req=Net::HTTP::Get.new(url.request_uri)
		res=http.request(req)
		#puts res.body
		#puts res.valid_json?
		res.body
	end;

	def get_json(opts={})
        result = get_https(opts)
        if not result.is_a? String or not result.valid_json?
          raise RuntimeError, "Server returned invalid data."
        end
        JSON.load result
      end
end;	

c2=Slogen.new;
puts c2.get_json

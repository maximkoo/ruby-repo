require 'net/http'
require 'openssl'
require 'json'
def get_https(opts={})
        raise ArgumentError if not opts[:url].is_a? String
        puts "OPTS= "+opts[:url]
        uri = URI.parse opts[:url]
        http = Net::HTTP.new uri.host, uri.port
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        if opts[:params].nil?
          request = Net::HTTP::Get.new uri.request_uri
        else
          # If sending params, then we want a post request for authentication.
          request = Net::HTTP::Post.new uri.request_uri
          request.add_field "Key", opts[:key]
          request.add_field "Sign", opts[:signed]
          request.set_form_data opts[:params]
        end
        response = http.request request
        response.body
      end

puts get_https({url: "https://wex.nz/api/3/ticker/btc_usd"});      
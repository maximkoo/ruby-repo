require 'uri'
require 'net/http'

uri = URI("http://localhost:3000/external_post")
https = Net::HTTP.new(uri.host, uri.port)
#https.use_ssl = true

request = Net::HTTP::Post.new(uri.path)

request["HEADER1"] = 'VALUE1'
request["HEADER2"] = 'VALUE2'

response = https.request(request)
puts response
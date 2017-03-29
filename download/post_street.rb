require 'net/http'
require 'uri'
require 'json'
# using block
uri = URI.parse("http://localhost:3000/external_post");
header = {'Content-Type'=> 'application/json'}
street = {"name"=>"OLOLOLOLO"}

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = street.to_json
#request.body =

# Send the request
response = http.request(request)
#postData = Net::HTTP.post_form(uri, {'p_name'=>'OLOLO'})
puts response
x=JSON.parse(response.body);
puts x["token"]
puts x["courseId"]


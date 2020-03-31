require 'json'
begin
	x=JSON.parse(File.read("./autohash.rb"));
rescue JSON::ParserError
	puts "The json file is not well-formed"
ensure
	puts "Finally, we are done"
end;	
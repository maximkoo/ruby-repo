require 'json'
str='{"values": {"key1":"1", "key2":"2"}, "desc":"some descriptions"}'
a=JSON.parse(str)
puts a["values"]
puts a["values"]["key1"]
puts a["desc"]


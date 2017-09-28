# { "columns":32,
#  "image":"generic_platformer_tiles.png",
#  "imageheight":768,
#  "imagewidth":1024,
#  "margin":0,
#  "name":"t1",
#  "spacing":0,
#  "tilecount":768,
#  "tileheight":32,
#  "tilewidth":32,
#  "type":"tileset"
# }
require 'json'
def prs
	json=File.read('t11.json')
	obj=JSON.parse(json)
	puts obj["columns"]
	puts obj["image"]
end;

prs
puts 18*32
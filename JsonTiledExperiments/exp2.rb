require 'json'
require 'gosu'
map=JSON.parse(File.read('c:\Users\max\Ruby\JsonTiledPlatformer4.1\assets\maps\LongerMap.json'));
# $map["layers"].each do |layer|
# 	puts layer["name"];
# end;

class TiledMap	
	attr_reader :height,:width, :layers, :tilesets

	def initialize(json)
		puts "Can not process infinite maps" if json["infinite"]=="true"
		@height=json["height"]
		@width=json["width"]
		@tilewidth=json["tilewidth"]
		@tileheight=json["tileheight"]

		@layers=[]
		@tilesets=[]

		json["layers"].each do |layer_data|
			Layer.new(self, layer_data);
		end;	

		json["tilesets"].each do |tileset_data|
			Tileset.new(self  , tileset_data);
		end;	
	end;
	
end;

class Layer
	def initialize(master, data)
		@id=data["id"]
		@name=data["name"]
		@type=data["type"]
		@visible=data["visible"]
		@data=data["data"]
		@x,@y=data["x"],data["y"]
		@width,@height=data["width"],data["height"]
		master.layers<<self;
	end;
end;	

class Tileset
	def initialize(master, data)
		@firstgid=data["firstgid"]
		@tilecount=data["tilecount"]
		@lastgid=@firstgid+@tilecount-1
		@columns=data["columns"]
		
		@tileheight=data["tileheight"]
		@tilewidth=data["tilewidth"]
			path='c:\/Users\/max\/Ruby\/JsonTiledPlatformer4.1\/assets\/maps\/'
		@tiles=Gosu::Image.load_tiles(path+data["image"], data["tilewidth"], data["tileheight"]);
		master.tilesets<<self;
	end;

	def getTileByLocalId(n)
		@tiles[n]
	end;	
end;	

tm=TiledMap.new(map)
require 'json'
require 'gosu'

OBJECTLAYER="objectgroup"
TILELAYER="tilelayer"
map=JSON.parse(File.read('c:\Users\max\Ruby\JsonTiledPlatformer4.1\assets\maps\LongerMap.json'));
# $map["layers"].each do |layer|
# 	puts layer["name"];
# end;

class TiledMap	
	attr_reader :height,:width, :tilelayers, :objectlayers, :tilesets

	def initialize(json)
		puts "Can not process infinite maps" if json["infinite"]=="true"
		@height=json["height"]
		@width=json["width"]
		@tilewidth=json["tilewidth"]
		@tileheight=json["tileheight"]

		@tilelayers=[]
		@objectlayers=[]
		@tilesets=[]

		json["layers"].each do |layer_data|
			if layer_data["type"]==TILELAYER
				TileLayer.new(@tilelayers, layer_data);
			elsif layer_data["type"]==OBJECTLAYER
				ObjectLayer.new(@objectlayers, layer_data);
			end;	
		end;	

		json["tilesets"].each do |tileset_data|
			Tileset.new(@tilesets, tileset_data);
		end;	
	end;
	
end;

class Layer
	def initialize(master, data)
		@id=data["id"]
		@name=data["name"]
		@type=data["type"]
		@visible=data["visible"]		
		@x,@y=data["x"],data["y"]
		@width,@height=data["width"],data["height"]
		master<<self;
	end;
end;	

class TileLayer<Layer
	def initialize(master,data)
		super(master,data)
		@data=data["data"]
	end;	
end;

class ObjectLayer<Layer
	def initialize(master,data)
		super(master,data)
		@objects=data["objects"]
	end;	
end;

class TiledObject

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
		master<<self;
	end;

	def getTileByLocalId(n)
		@tiles[n]
	end;	
end;	

tm=TiledMap.new(map)
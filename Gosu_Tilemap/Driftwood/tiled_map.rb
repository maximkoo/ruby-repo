require './layer.rb'
require './tileset.rb'
require './objects.rb'
require 'json'

OBJECTLAYER="objectgroup"
TILELAYER="tilelayer"

class TiledMap
	attr_reader :height,:width, :layers, :tilesets 

	def initialize(path_to_map)
		json=JSON.parse(File.read(path_to_map))
		puts "Can not process infinite maps" if json["infinite"]=="true"
		@height=json["height"]
		@width=json["width"]
		@tilewidth=json["tilewidth"]
		@tileheight=json["tileheight"]

		@layers=[]
		@tilesets=[]

		json["layers"].each do |layer_data|
			if layer_data["type"]==TILELAYER
				TileLayer.new(self, layer_data);
			elsif layer_data["type"]==OBJECTLAYER
				ObjectLayer.new(self, layer_data);
			end;	
		end;	

		json["tilesets"].each do |tileset_data|
			Tileset.new(self, tileset_data);
		end;	
	end;

	def all_objects
		#return all objects from all layers
	end;	

	def getTilesetByGid(n)
		@tilesets.select{|t| n.between?(t.firstgid, t.lastgid)}.first
	end;	

	def getTileByGid(gid)
		tileset=getTilesetByGid(gid)
		#puts "GID=#{gid}"
		local_id=gid-tileset.firstgid;
		tileset.getTileByLocalId(local_id)
	end;

	def draw
		@layers.each do |layer|
			layer.draw;
		end;	
	end;
end;
require './layer.rb'
require './tileset.rb'
require './objects.rb'
require 'json'
require './service.rb'

OBJECTLAYER="objectgroup"
TILELAYER="tilelayer"
SHOW_EMPTY_OBJECTS=true

class TiledMap
	attr_reader :height,:width, :layers, :tilesets 

	def initialize(path_to_map,file_name)
		begin
			json=JSON.parse(File.read(File.join(path_to_map,file_name)))
		rescue Errno::ENOENT
			abort("The file does not exist!");
		rescue JSON::ParserError
			abort("The file is not well-formed!");
		end;
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
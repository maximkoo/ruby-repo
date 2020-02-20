require './layer.rb'
require './tileset.rb'
require './objects.rb'
require './animation.rb'
require 'json'
require './service.rb'

OBJECTLAYER="objectgroup"
TILELAYER="tilelayer"
SHOW_EMPTY_OBJECTS=true
SHOW_TILED_OBJECTS=true
LARGE_FONT= Gosu::Font.new(height=20,options={name:"Courier New"})

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

		@animations=[]
		@tilesets.each do |t|
			@animations+=t.animations if t.animations
		end;	
		puts "Tiled Map reporting: animations count is #{@animations.size}"		
		@animations
	end;	

	def all_objects
		#return all objects from all layers
		objs=[]
		@layers.each do |layer|
			objs+=layer.objects if layer.class.name=="ObjectLayer"
		end;
		objs
	end;	

	def all_animations
		@animations
	end;	

	def getTilesetByGid(n)
		nn=n-2**31 if n>1000000
		@tilesets.select{|t| (nn||=n).between?(t.firstgid, t.lastgid)}.first
	end;	

	def getTileByGid(gid)
		tileset=getTilesetByGid(gid)
		#puts "GID=#{gid}"
		
		# if @animations.any?{|ani| ani.gid==gid}
		# 	a=@animations.select{|ani| ani.gid==gid}.first
		# 	local_id=a.current_gid+a.master.firstgid
		# 	puts "got it, local_id=#{local_id}"
		# else 
		# 	local_id=gid-tileset.firstgid;	
		# end;	
		local_id=nil;
		@animations.select{|ani| ani.big_gid==gid}.each do |a|
			#puts "a.big_gid=#{a.big_gid}"
			#puts "gid=#{gid}"
			local_id=a.current_gid#+a.master.firstgid
			#puts "a.current_gid=#{a.current_gid}"
			#puts "a.master.firstgid=#{a.master.firstgid}"
			#puts "local_id(1)=#{local_id}"
			break
		end;
		local_id=gid-tileset.firstgid if local_id.nil?;	
		#puts "local_id(2)=#{local_id}"
		local_id-=2**31 if local_id>1000000
		tileset.getTileByLocalId(local_id)
	end;

	def draw
		@layers.each do |layer|
			layer.draw;
		end;	
	end;
end;
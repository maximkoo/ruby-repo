class Tileset
	attr_reader :firstgid, :lastgid, :animations
	def initialize(master, data)
		@firstgid=data["firstgid"]
		@tilecount=data["tilecount"]
		@lastgid=@firstgid+@tilecount-1
		@columns=data["columns"]
		
		@tileheight=data["tileheight"]
		@tilewidth=data["tilewidth"]


		path=File.join(File.dirname($0),'assets','maps',data["image"]);
		@tiles=Gosu::Image.load_tiles(path, data["tilewidth"], data["tileheight"],{tileable:true});

		#@animations=[].tap {|ani|ani<<data["tiles"] if data["tiles"]}	
		@animations=[]
		if data["tiles"]
			data["tiles"].each do |a|
				@animations<<Animation.new(self, a)
			end;
		end;	
			#binding.pry
		master.tilesets<<self;
	end;

	def getTileByLocalId(id)
		@tiles[id]
	end;	

	def getTileByTilesetAndId

	end;
end;
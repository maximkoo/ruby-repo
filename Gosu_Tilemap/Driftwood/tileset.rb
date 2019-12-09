class Tileset
	attr_reader :firstgid, :lastgid	
	def initialize(master, data)
		@firstgid=data["firstgid"]
		@tilecount=data["tilecount"]
		@lastgid=@firstgid+@tilecount-1
		@columns=data["columns"]
		
		@tileheight=data["tileheight"]
		@tilewidth=data["tilewidth"]
			#path='c:\/Users\/max\/Ruby\/JsonTiledPlatformer4.1\/assets\/maps\/'
		path=File.join(File.dirname($0),'assets','maps',data["image"]);
		@tiles=Gosu::Image.load_tiles(path, data["tilewidth"], data["tileheight"],{tileable:true});
		master.tilesets<<self;
	end;

	def getTileByLocalId(id)
		@tiles[id]
	end;	

	def getTileByTilesetAndId

	end;
end;
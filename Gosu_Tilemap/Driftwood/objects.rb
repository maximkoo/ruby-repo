class AbstractObject
	attr_accessor :layer
	def initialize(layer, data)
		@layer=layer
		@layer.objects<<self
		@id=data["id"]
		@x,@y=data["x"],data["y"]
		@width,@height=data["width"],data["height"]
		@name=data["name"]
		@rotation,@type,@visible=data["rotation"],data["type"],data["visible"]
	end;
end;

class EmptyObject<AbstractObject
	def initialize
		super(layer,data)
	end;	
end;

class TiledObject<AbstractObject
	def initialize
		super(layer,data)
		@gid=data["gid"]
	end;

	def updateTile

	end;	
end;

#  "gid":204,
#  "height":70,
#  "id":65,
#  "name":"KeyOrange",
#  "rotation":0,
#  "type":"Bonus",
#  "visible":true,
#  "width":70,
#  "x":70,
#  "y":210
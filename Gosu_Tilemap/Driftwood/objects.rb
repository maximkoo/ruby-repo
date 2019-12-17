class AbstractObject
	
	attr_accessor :layer
	def initialize(layer, data)
		@layer=layer
		@layer.objects<<self
		# @id=data["id"]
		# @x,@y=data["x"],data["y"]
		# @width,@height=data["width"],data["height"]
		# @name=data["name"]
		# @rotation,@type,@visible=data["rotation"],data["type"],data["visible"]
		Service.set_data_methods(self,data)		
	end;

	def draw

	end;		
end;

class EmptyObject<AbstractObject
	@@large_font = Gosu::Font.new(height=20,options={name:"Courier New"})
	def initialize(layer, data)
		super(layer,data)
	end;	

	def draw
		if SHOW_EMPTY_OBJECTS
			Gosu.draw_line(@x,@y,Gosu::Color::RED,@x+@width,@y,Gosu::Color::RED,20)
			Gosu.draw_line(@x+@width,@y,Gosu::Color::RED,@x+@width,@y+@height,Gosu::Color::RED,20)
			Gosu.draw_line(@x+@width,@y+@height,Gosu::Color::RED,@x,@y+height,Gosu::Color::RED,20)
			Gosu.draw_line(@x,@y+height,Gosu::Color::RED,@x,@y,Gosu::Color::RED,20)
			@@large_font.draw(@name,@x,@y,20,1,1,Gosu::Color::RED)
		end;	
	end;	
end;

class TileObject<AbstractObject
	def initialize(layer, data)
		super(layer,data)
		@gid=data["gid"]
	end;

	def draw
		#puts "Drawing object #{@name}, x=#{@x}, y=#{@y}"
		layer.master.getTileByGid(@gid).draw(@x,@y-@height,20,1,1);
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
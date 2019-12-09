require "gosu"
require "./tiled_map.rb"

class G1<Gosu::Window
	def initialize
		super 700,700, false  
		p=File.join(File.dirname($0),'assets','maps','exp2.json')
		@tm=TiledMap.new(p)
	end;

	def draw
		@tm.draw
	end;
end;

g1=G1.new
g1.show;	
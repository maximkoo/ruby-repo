require "gosu"
require 'pathname'
require "./tiled_map.rb"

class G1<Gosu::Window
	def initialize
		super 700,700, false  
		p=File.join(File.dirname($0),'assets','maps')
		abort "Incorrect path in run.rb" if !Pathname.new(p).exist?
		@tm=TiledMap.new(p,"exp2.json")		
	end;

	def draw
		@tm.draw
	end;
end;

g1=G1.new
g1.show;	
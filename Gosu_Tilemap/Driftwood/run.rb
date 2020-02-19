require "gosu"
require 'pathname'
require "./tiled_map.rb"
require './routine_holder.rb'
require 'pry'

FRAME_DELAY=16
ANIMATION_DELAY=100

class G1<Gosu::Window
	def initialize
		super 700,700, false  
		p=File.join(File.dirname($0),'assets','maps')
		abort "Incorrect path in run.rb" if !Pathname.new(p).exist?
		@tm=TiledMap.new(p,"exp2.json")
		@objects=@tm.all_objects
		@animations=@tm.all_animations
			#binding.pry
		#puts "Objects are:"	
		#puts @objects
	end;

	def draw
		@tm.draw
	end;

	def update
		now=Gosu.milliseconds
		if (now-@last_update_objects||=now) >= FRAME_DELAY 
			@objects.map(&:update);
			@last_update_objects=now;
		end;
		if (now-@last_update_animations||=now) >= ANIMATION_DELAY 
			@animations.map(&:update);
		 	@last_update_animations=now;
		end;	
	end;
end;

g1=G1.new
g1.show;	
require "gosu"
require 'pathname'
require "./tiled_map.rb"
require './routine_holder.rb'

FRAME_DELAY=16

class G1<Gosu::Window
	def initialize
		super 700,700, false  
		p=File.join(File.dirname($0),'assets','maps')
		abort "Incorrect path in run.rb" if !Pathname.new(p).exist?
		@tm=TiledMap.new(p,"exp2.json")
		@objects=@tm.all_objects
		puts "Objects are:"	
		puts @objects
	end;

	def draw
		@tm.draw
	end;

	def update
		now=Gosu.milliseconds
		return if (now-@last_update||=now) < FRAME_DELAY 
		#@objectPool.objects.map(&:update);
		#@objectPool.update;
		@objects.each{|obj|obj.update}
		#@player.update;
		@last_update=now;
	end;
end;

g1=G1.new
g1.show;	
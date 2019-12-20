require 'gosu'
FRAME_DELAY=128
SCALE=10

class ViewWindow<Gosu::Window
	def initialize
		super(800,800)
		@nps=Guard.new
	end;

	def update
		now=Gosu.milliseconds
		return if (now-@last_update||=now) < FRAME_DELAY 
		@nps.update;
		@last_update=now;
	end;
	
	def draw
		@nps.draw;
	end;	
end;	

class Guard
	attr_accessor :tiles
	def initialize
		path=File.join(".","assets","PC Computer - Wolfenstein 3D - Guard_c.png")
		@tiles=Gosu::Image.load_tiles(path, 65, 65,{tileable:false, retro:true});
		@current_side=0
		@current_pos=0
		@dist=20
	end;	

	def current_idx
		@current_pos*8+@current_side
	end;	

	def update		
		@dist=[@dist-1,1].max
		@current_pos=(@current_pos+1) % 4
		#@current_pos=0 if @current_pos>3 
		#puts @current_pos
		#@current_side=(@current_side+0.2) % 8
		keyControl
	end;
		
	def draw
		sc=SCALE.fdiv(@dist)
		@tiles[current_idx].draw(300,200,10,sc,sc)
	end;	

	def keyControl
		if $w.button_down?(Gosu::KbRight)
    		@current_side-=1
    		@current_side=7 if @current_side<0 
    	elsif $w.button_down?(Gosu::KbLeft)
    		@current_side=(@current_side+1) % 8 	
    	end
	end;	
end;	

$w=ViewWindow.new
$w.show
		
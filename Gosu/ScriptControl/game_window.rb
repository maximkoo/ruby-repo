require 'gosu'
require './game_object.rb'
require './spaceShips_001.rb'
require './routine_holder.rb'

	POLYGON_LAYER=10
	IDLE_OBJECTS_LAYER=15
	GRAPHICS_LAYER=20

	DRAW_POLYGONS=true
	DRAW_GRAPHICS=true

class ObjectPool
	attr_accessor :objects
	def initialize
		@objects=[]
	end;
end;

class GameWindow<Gosu::Window
	SCREEN_WIDTH=Gosu.screen_width;
	SCREEN_HEIGHT=Gosu.screen_height;
	def initialize
		super(SCREEN_WIDTH/2,SCREEN_HEIGHT-100)
		@objectPool=ObjectPool.new		

		### Run the game ###
		@s1=SpaceShips_001.new(@objectPool, 100,100,180)
		puts " ---"
		puts @objectPool.objects
		###
	end;

	def needs_cursor?
    	true
  	end 
  
  	def button_down(id)
        if id==Gosu::KbEscape
      		close    	
    	end;
    end;

    def update
    	@objectPool.objects.map(&:update);
    end;

    def draw
    	@objectPool.objects.map(&:draw)
    	#@s1.draw
    end;	
end; 

	 

g=GameWindow.new
g.show;
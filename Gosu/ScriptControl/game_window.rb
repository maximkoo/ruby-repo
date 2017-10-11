require 'gosu'
require './utils.rb'
require './game_object.rb'
require './spaceShips_001.rb'
require './meteor.rb'
require './routine_holder.rb'

	POLYGON_LAYER=10
	IDLE_OBJECTS_LAYER=15
	GRAPHICS_LAYER=20

	DRAW_POLYGONS=true
	DRAW_GRAPHICS=false

	NEARBY_DISTANCE=100;

class ObjectPool
	attr_accessor :objects
	def initialize
		@objects=[]
	end;

	def nearby(object)
		@objects.select do|obj|
			obj!=object && Utils.distance_between(object.x, object.y, obj.x, obj.y)<NEARBY_DISTANCE
		end;	
	end;	
end;

class GameWindow<Gosu::Window
	SCREEN_WIDTH=Gosu.screen_width;
	SCREEN_HEIGHT=Gosu.screen_height;
	def initialize
		super(SCREEN_WIDTH/2,SCREEN_HEIGHT-100)
		@objectPool=ObjectPool.new		

		### Run the game ###
		@s1=SpaceShips_001.new(@objectPool, 200,539,80)
		@m1=Meteor.new(@objectPool, 500,400,0)
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

    	@objectPool.objects.each do |a| ## Пока что так
    		if a.x<-50 || a.x>SCREEN_WIDTH+50 || a.y<-50 ||  a.y>SCREEN_HEIGHT+50
    			a.expired=true
    			#puts "#{a} is expired"
    		end;	
    	end;	

    	@objectPool.objects.reject!{|a| a.expired==true}
    end;

    def draw
    	@objectPool.objects.map(&:draw)
    	#@s1.draw
    end;	
end; 

g=GameWindow.new
g.show;
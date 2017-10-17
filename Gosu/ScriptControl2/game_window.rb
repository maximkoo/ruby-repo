require 'gosu'
require './game_object.rb'
require './object_pool.rb'
require './image_files.rb'
require './objects/enemy_red1.rb'
#require './utils.rb'
#require './game_object.rb'
#require './spaceShips_001.rb'
#require './meteor.rb'
#require './routine_holder.rb'
#require './explosion.rb'
#require './space_station_hat.rb'

#CONSTANTS
	FRAME_DELAY=16

	POLYGON_LAYER=10
	IDLE_OBJECTS_LAYER=15
	GRAPHICS_LAYER=20

	DRAW_POLYGONS=false
	DRAW_GRAPHICS=true

	NEARBY_DISTANCE=100;

	SCALER=0.5

class GameWindow<Gosu::Window
	include ImageFiles
	SCREEN_WIDTH=Gosu.screen_width;
	SCREEN_HEIGHT=Gosu.screen_height;
	def initialize
		super(SCREEN_WIDTH/2,SCREEN_HEIGHT-100)
		@objectPool=ObjectPool.new		

		# Explosion animation
		#$explanim=Gosu::Image.load_tiles('./explosionframes1.png', 1024/8,384/3);    

		### Run the game ###
		EnemyRed1.new(@objectPool, 100,100,180, 0)

		#@s1=SpaceShips_001.new(@objectPool, 100,100,180, 0)
		# @s2=SpaceShips_001.new(@objectPool, 300,550,0, 10)

		# @x1=SpaceShips_001.new(@objectPool, 320,300,0, 25)
		# @x2=SpaceShips_001.new(@objectPool, 320,250,0, 250)
		# @x3=SpaceShips_001.new(@objectPool, 320,200,0, 250)
		# @x4=SpaceShips_001.new(@objectPool, 320,150,0, 250)
		# #@m1=Meteor.new(@objectPool, 500,350,0)
		# @m2=Meteor.new(@objectPool, 100,570,0)
		# @sh1=SpaceStationHat.new(@objectPool,500,150,-15)

		puts "*** OBJECT POOL CONTENTS ***"
		puts @objectPool.objects
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
    	 now=Gosu.milliseconds
    	return if (now-@last_update||=now) < FRAME_DELAY 
    	@objectPool.objects.map(&:update);

    	@objectPool.objects.each do |a| ## Пока что так
    		if a.x<-50 || a.x>SCREEN_WIDTH+50 || a.y<-50 ||  a.y>SCREEN_HEIGHT+50
    			a.expired=true
    			#puts "#{a} is expired"
    		end;	
    	end;	

    	@objectPool.objects.reject!{|a| a.expired==true}
    	@last_update=now
    end;

    def draw
    	@objectPool.objects.map(&:draw)
    	#@s1.draw
    end;	
end; 

g=GameWindow.new
g.show;
require 'gosu'
require './game_object.rb'
require './object_pool.rb'
require './image_files.rb'
require './background.rb'
require './player.rb'
require './objects/enemy_red1.rb'
require './objects/enemy_red2.rb'
require './objects/enemy_red3.rb'
require './objects/meteor_brown_big1.rb'
require './objects/boss1.rb'
#require './utils.rb'
#require './game_object.rb'
#require './spaceShips_001.rb'
#require './meteor.rb'
#require './routine_holder.rb'
#require './explosion.rb'
#require './space_station_hat.rb'

#CONSTANTS
	FRAME_DELAY=16

	GAME_SPEED=0.5

	BACKGROUND_LAYER=0
	POLYGON_LAYER=10
	IDLE_OBJECTS_LAYER=15
	GRAPHICS_LAYER=20
	PLAYER_LAYER=25

	EXPLOSION_LAYER=50

	DRAW_POLYGONS=true
	DRAW_GRAPHICS=true

	NEARBY_DISTANCE=70;

	SCALER=0.5

class GameWindow<Gosu::Window
	include ImageFiles
	SCREEN_WIDTH=Gosu.screen_width;
	SCREEN_HEIGHT=Gosu.screen_height;
	def initialize
		#super(SCREEN_WIDTH/2,SCREEN_HEIGHT-100)
		$window_width=600
		$window_height=600;
		super($window_width,$window_height)
		@objectPool=ObjectPool.new		
		$passed=0;
		Background.new(@objectPool)

		### Run the game ###
		# EnemyRed1.new(@objectPool, 350,400,270, :shoot_only)
		# EnemyRed1.new(@objectPool, 300,400,270, 1)

		# EnemyRed2.new(@objectPool, 550,50,210, :shoot_move)

		
		#EnemyRed2.new(@objectPool, 550,450,335, :shoot_only)

		# EnemyRed2.new(@objectPool, 0,0,90, :wave_down)
	 #    EnemyRed2.new(@objectPool, -50,0,90, :wave_down)
		# EnemyRed2.new(@objectPool, -100,0,90, :wave_down)

		MeteorBrownBig1.new(@objectPool, 380,250,0)

		EnemyRed3.new(@objectPool, 625,100,270, :round_shoot)
		EnemyRed3.new(@objectPool, 700,100,270, :round_shoot)
		EnemyRed3.new(@objectPool, 775,100,270, :round_shoot)
		EnemyRed3.new(@objectPool, 850,100,270, :round_shoot)
		EnemyRed3.new(@objectPool, 925,100,270, :round_shoot)

		Boss1.new(@objectPool, 100,400, 0, :rotate_left)
		#@s1=SpaceShips_001.new(@objectPool, 100,100,180, 0)
		# @s2=SpaceShips_001.new(@objectPool, 300,550,0, 10)

		# @x1=SpaceShips_001.new(@objectPool, 320,300,0, 25)
		# @x2=SpaceShips_001.new(@objectPool, 320,250,0, 250)
		# @x3=SpaceShips_001.new(@objectPool, 320,200,0, 250)
		# @x4=SpaceShips_001.new(@objectPool, 320,150,0, 250)
		# #@m1=Meteor.new(@objectPool, 500,350,0)
		# @m2=Meteor.new(@objectPool, 100,570,0)
		# @sh1=SpaceStationHat.new(@objectPool,500,150,-15)

		@player=Player.new(@objectPool, 320,550,0)
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
    		#if a.x<-50 || a.x>SCREEN_WIDTH+50 || a.y<-50 ||  a.y>SCREEN_HEIGHT+50
    		if a.x<-150 || a.x>SCREEN_WIDTH || a.y<-50 ||  a.y>$window_height+50
    			a.expired=true
    			#puts "#{a} is expired"
    		end;	
    	end;	

    	@objectPool.objects.reject!{|a| a.expired==true}
    	@last_update=now
    	#puts @objectPool.objects.size;
    end;

    def draw
    	@objectPool.objects.map(&:draw)
    	#@s1.draw
    end;	
end; 

$g=GameWindow.new
$g.show;
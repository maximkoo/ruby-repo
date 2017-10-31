require 'gosu'
require './game_object.rb'
require './object_pool.rb'
require './image_files.rb'
require './background.rb'
require './player.rb'
require './laser.rb'
require './objects/laser_blue01.rb'
require './objects/laser_red01.rb'

require './enemy.rb'
require './objects/enemy_red1.rb'
require './objects/enemy_red2.rb'
require './objects/enemy_red3.rb'

require './idle.rb'
require './objects/meteor_brown_big1.rb'
require './objects/boss1.rb'
require './objects/explosion_big.rb'
require './objects/satellite_yellow.rb'

require './components/physics_component.rb'
require './components/graphics_component.rb'
require './components/polygon_component.rb'
require './components/collider_component.rb'

require './interface/energy_bar.rb';
require './Scenario.rb'

	FRAME_DELAY=16

	GAME_SPEED=0.5

	BACKGROUND_LAYER=0
	POLYGON_LAYER=10
	IDLE_OBJECTS_LAYER=15
	LASER_LAYER=19
	GRAPHICS_LAYER=20
	PLAYER_LAYER=25
	INTERFACE_LAYER=50;

	EXPLOSION_LAYER=50

	DRAW_POLYGONS=false
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
		super($window_width,$window_height, true)
		@objectPool=ObjectPool.new		
		$passed=0;

		@object_array=[] #inactive objects

		Background.new(@objectPool)

		@sc=Scenario.new;
		puts @sc.scenario1;
		scan_object_array(@sc);
		
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

    	# @objectPool.objects.each do |a| ## Пока что так
    	# 	if a.x<-150 || a.x>SCREEN_WIDTH || a.y<-50 ||  a.y>$window_height+50
    	# 		a.expired=true
    	# 		puts "#{a} is expired"
    	# 	end;	
    	#end;	

    	#@objectPool.objects.reject!{|a| puts "To be rejected: #{a}" if a.expired==true; a.expired==true}
    	@objectPool.objects.reject!{|a| a.expired==true}

    	#puts @objectPool.objects.size;
    	previous_passed=$passed;
    	$passed+=GAME_SPEED ###---<<<!!!!
    	if $passed%20<previous_passed%20
    		scan_object_array(@sc);
    	end;	
    	@last_update=now;
    end;

    def draw
    	@objectPool.objects.map(&:draw)
    	#@s1.draw
    end;	

    def scan_object_array(sc)
		#puts "$passed=#{$passed}"
		sc.scenario1.each do |obj|	
			if (obj[:y]+$passed>0) && (obj[:active]==false)
				#puts "obj_type=#{obj[:type]}"
		#		puts obj
				a=Object.const_get(obj[:type]).new(@objectPool, obj[:x], obj[:y]+$passed, obj[:angle], obj[:id]);
				obj[:active]=true;
			
				#puts "*** OBJECT POOL CONTENTS ***"
				#puts @objectPool.objects
			end;	
		end;		
    end;	
end; 

$g=GameWindow.new
$g.show;
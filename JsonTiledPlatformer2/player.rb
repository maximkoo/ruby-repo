require './player_state.rb'
require './detector.rb'
class Player<MovableGameObject
	def initialize(master,x,y)
		super(master,x,y)		
		@walking=PlayerWalking.new(self,x,y);
		@falling=PlayerFalling.new(self,x,y);
		@state=@falling;
		@w,@h=@state.img.width,@state.img.height;
	end;

	def draw
		@state.draw;
	end;

	def toState(old_state,new_state)
		#old_state - PlayerState
		#new_state - String
		case new_state			
			when "walk" then ns=@walking
			when "fall" then ns=@falling
		end;
		ns.enter(old_state.x,old_state.y);		
		@state=ns;
	end;

	def update
		@state.update;
	end;	
end;	

class PlayerWalking<PlayerState
	def initialize(master, x,y)
		super(master,x,y)
		@player_anim=Gosu::Image.load_tiles('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_walk\/Player2.png', 770/11,94); 
		@current_frame=0;
		@w,@h=@player_anim[@current_frame].width,@player_anim[@current_frame].height;
		@xS=5; @yS=0;
		# @controlPoints=[]
		# @controlPoints<<ControlPoint.new(self, 0,0)
		# @controlPoints<<ControlPoint.new(self, 0,0)
		# resetControlPoints(x,y)

	end;

	def enter(x,y)
		@x,@y=x,y
		# resetControlPoints(x,y)
		##########
		detector=Detector.new(self,x,y);
		detector.detect;
		puts "Control Points"
		puts detector.controlPoints.to_s
		##########
	end;

	# def resetControlPoints(x,y)
	# 	@controlPoints[0].x,@controlPoints[0].y=x-1,y+@h+1
	# 	@controlPoints[1].x,@controlPoints[1].y=x+@w+1,y+@h+1
	# end;	

	def draw
		#@img.draw(@x,@y,10);
		@player_anim[@current_frame].draw(@x,@y,10);
	end;	

	def update
		move;
		#@controlPoints.each {|c| c.move};
		#@components.each {|c| c.update}
		@current_frame=(@current_frame+1) % @player_anim.size
		#if !$collider.pointInObstacle?(x,y,x,y+94+1)	
		#if !$collider.pointInObstacle?(@controlPoint.x,@controlPoint.y)
		# if @controlPoints.select{|c| $collider.pointInObstacle?(c.x,c.y)==true}.size==0		
		# 	puts "No ground"
		# 	@origin.toState(self,"fall");
		# end;	
	end;	

	def img
		#@img
		@player_anim[@current_frame]		
	end;
end;	

class PlayerFalling<PlayerState
	#include Moving
	def initialize(master,x,y)
		super(master,x,y)
		@img=Gosu::Image.new('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_hurt.png')
		#@x,@y=x,y
		#@origin=origin;
		@xS=0; @yS=5;
		@w,@h=@img.width,@img.height;
	end;

	def enter(x,y)
		@x,@y=x,y
	end;

	def draw
		@img.draw(@x,@y,10);
	end;	
	
	def update
		move;
		 if $collider.collide?(self)
		 	puts "Collide!"
            contact=$collider.contact(self);
            @x=contact[:contactX];
            @y=contact[:contactY];
  			@master.toState(self,"walk");
  		end;
	end;	

	def img
		@img
	end;
end;

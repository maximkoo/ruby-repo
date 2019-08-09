require './player_state.rb'
require './mini_collider.rb'
require './detector.rb'
class Player<MovableGameObject
	def initialize(master,x,y)
		super(master,x,y)		
		@walking=PlayerWalking.new(self,x,y);
		@falling=PlayerFalling.new(self,x,y);
		@standing=PlayerStanding.new(self,x,y);
		@state=@falling;
		@w,@h=@state.img.width,@state.img.height;
		@state.face="right";
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
			when "stop" then ns=@standing
		end;
		ns.enter(old_state.x,old_state.y);	
		ns.face=old_state.face;	
		@state=ns;
	end;

	def update
		@state.update;
	end;	
end;	

class PlayerStanding<PlayerState
	def initialize(master, x,y)
		super(master,x,y)
		@img=Gosu::Image.new('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_front.png')
		@xS=0; @yS=0;
		@w,@h=@img.width,@img.height;
		@detector=WalkingDetector.new(self,x,y);
	end;

	def enter(x,y)
		@x,@y=x,y
		@detector.reset(x,y)
	end;

	def draw
		@img.draw(@x,@y,10);
	end;

	def update

	end; 	

	def img
		@img;
	end;	
end;		

class PlayerWalking<PlayerState
	def initialize(master, x,y)
		super(master,x,y)
		@player_anim=[]
		@player_anim[0] =Gosu::Image.load_tiles('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_walk\/Player2.png', 770/11,94); 
		@player_anim[1] =Gosu::Image.load_tiles('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_walk\/Player2_left.png', 770/11,94); 
		@current_frame=0;
		#@w,@h=@player_anim[@current_frame].width,@player_anim[@current_frame].height;
		@w,@h=img.width,img.height;
		@xS=-5; @yS=0;
		@collider=WalkingCollider.new(self,x,y)
		@detector=WalkingDetector.new(self,x,y);
	end;

	def enter(x,y)
		@x,@y=x,y
		@detector.reset(x,y)
	end;

	def draw
		#@img.draw(@x,@y,10);
		#@player_anim[@current_frame].draw(@x,@y,10);
		img.draw(@x,@y,10);
	end;	

	def update
		move;
		@current_frame=(@current_frame+1) % @player_anim[0].size;		
		@collider.update;
		@detector.update;
		@xS>=0? @face="right" : @face="left";
	end;	

	def img
		#@img
		#case when @xS>=0 
		case when @face=="right"
			@player_anim[0][@current_frame]
		else
			@player_anim[1][@current_frame]	
		end;		
	end;

	def reverse
		@xS=-@xS
	end;	
end;	

class PlayerFalling<PlayerState
	def initialize(master,x,y)
		super(master,x,y)
		@img=[]
		@img[0]=Gosu::Image.new('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_hurt.png')
		@img[1]=Gosu::Image.new('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_hurt_left.png')
		@xS=0; @yS=5;
		@w,@h=img.width,img.height;
		@collider=FallingCollider.new(self,x,y)
	end;

	def enter(x,y)
		@x,@y=x,y
	end;

	def draw
		img.draw(@x,@y,10);
	end;	
	
	def update
		move;
		@collider.update;
	end;	

	def img
		#@img
		#case when @xS>=0
		case when @face=="right" 
			@img[0]
		else
			@img[1]	
		end;		
	end;
end;

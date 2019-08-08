require './player_state.rb'
require './detector.rb'
class Player<MovableGameObject
	def initialize(master,x,y)
		super(master,x,y)		
		@walking=PlayerWalking.new(self,x,y);
		@falling=PlayerFalling.new(self,x,y);
		@standing=PlayerStanding.new(self,x,y);
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
			when "stop" then ns=@standing
		end;
		ns.enter(old_state.x,old_state.y);		
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
		@player_anim=Gosu::Image.load_tiles('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_walk\/Player2.png', 770/11,94); 
		@current_frame=0;
		@w,@h=@player_anim[@current_frame].width,@player_anim[@current_frame].height;
		@xS=5; @yS=0;
		# @controlPoints=[]
		# @controlPoints<<ControlPoint.new(self, 0,0)
		# @controlPoints<<ControlPoint.new(self, 0,0)
		# resetControlPoints(x,y)
		@detector=WalkingDetector.new(self,x,y);
	end;

	def enter(x,y)
		@x,@y=x,y
		@detector.reset(x,y)
	end;

	def draw
		#@img.draw(@x,@y,10);
		@player_anim[@current_frame].draw(@x,@y,10);
	end;	

	def update
		move;
		@current_frame=(@current_frame+1) % @player_anim.size
		@detector.update;
		#puts self.x1,self.y1,self.x2, self.y2;
		 if $collider.collide?(self)
		 	puts "Collide Walking!"
            contact=$collider.contact(self);
            @x=contact[:safeX];
            @y=contact[:safeY];
  			@master.toState(self,"stop");
  			#@master.toState(self,"stop");
  		end;
	end;	

	def img
		#@img
		@player_anim[@current_frame]		
	end;
end;	

class PlayerFalling<PlayerState
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
		 	#puts self.x1,self.y1,self.x2, self.y2;
		 	puts "Collide!"
            contact=$collider.contact(self);
            @x=contact[:safeX];
            @y=contact[:safeY];
            #puts contact
  			@master.toState(self,"walk");
  			#@master.toState(self,"stop");
  		end;
	end;	

	def img
		@img
	end;
end;

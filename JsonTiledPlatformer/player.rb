require './moving.rb'
require './rectangle.rb'
class Player
	attr_accessor :x,:y,:w,:h,:c, :prevX, :prevY, :xS, :yS

	def initialize(x,y)
		@x,@y=x,y		
		@xS=35;
		@yS=35;
		###
		@walker=PlayerWalker.new(self,x,y);
		@faller=PlayerFaller.new(self,x,y);
		@state=@faller;
		@w,@h=@state.img.width,@state.img.height;
	end;


	def draw
		@state.draw;
	end;

	def toState(old_state,new_state)
		case new_state			
			when "walk" then ns=@walker
			when "fall" then ns=@faller
		end;
		ns.x=old_state.x;
		ns.y=old_state.y;
		@state=ns;
	end;

	def update
		@state.update;
	end;	
end;	

class PlayerWalker<Rectangle
	#include Moving	
	def initialize(origin, x,y)
		@player_anim=Gosu::Image.load_tiles('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_walk\/Player2.png', 770/11,94); 
		@current_frame=0;
		#@img=@player_anim[@current_frame];	
		@x,@y=x,y
		@origin=origin;
		#@w,@h=@img.width,@img.height;
		@w,@h=@player_anim[@current_frame].width,@player_anim[@current_frame].height;
		@xS=5; @yS=0;
		cp1=Rectangle.new(x,y+94+1,1,1);
		cp1.xS=@xS; cp1.yS=@yS;
		@control_points=[cp1]		
	end;

	def draw
		#@img.draw(@x,@y,10);
		@player_anim[@current_frame].draw(@x,@y,10);
	end;	

	def update
		move;		
		@control_points.each{|cp| cp.move}
		#puts @control_points.first.xS,@control_points.first.yS
		#puts @control_points.first.x,@control_points.first.y

		@current_frame=(@current_frame+1) % @player_anim.size
		if !$collider.collide?(@control_points.first);
			#puts @control_points.first.x,@control_points.first.y
			puts "No ground"
			@origin.toState(self,"fall");
		end;	
	end;	

	def img
		#@img
		@player_anim[@current_frame]		
	end;
end;	

class PlayerFaller<Rectangle
	#include Moving
	def initialize(origin,x,y)
		@img=Gosu::Image.new('..\/Graphics\/Platformer Art Complete Pack\/Base pack\/Player\/p2_hurt.png')
		@x,@y=x,y
		@origin=origin;
		@xS=0; @yS=5;
		@w,@h=@img.width,@img.height;
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
  			
  			@yS=0;
  			@origin.toState(self,"walk");
  		end;
	end;	

	def img
		@img
	end;
end;

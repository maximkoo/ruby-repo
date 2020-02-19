class PlayerJumping<PlayerState
	def initialize(master, x,y)
		super(master,x,y)
		@player_anim=[]
		@player_anim[0]=Gosu::Image.load_tiles(PLAYER_BLUE_JUMP_FILE, 140/2,94); 
		@current_frame=0;
		@w,@h=img.width,img.height;
		@xS=0; @yS=0;
		@collider=JumpingCollider.new(self,x,y)
		#@detector=JumpingDetector.new(self,x,y);
	end;

	def enter(x,y)
		puts "Jumping!"
		@x,@y=x,y
		@yS=-JUMPING_SPEED;
	end;

	def draw
		img.draw(@x,@y,10);
	end;	

	def update
		move;
		#@current_frame=(@current_frame+1) % @player_anim.first.size;		
		@face=="right"? @current_frame=0 : @current_frame=1
		@collider.update;
		#@detector.update;
		keyControl;
		@xS>=0? @face="right" : @face="left";
	end;	

	def img
		@player_anim[0][@current_frame]
	end;

	def keyControl
		# if $g.button_down?(Gosu::KbLeft)
  #   		@xS=@xS
  #   		@ys=@yS
  #   		@master.toState(self,"...");
  #   	elsif $g.button_down?(Gosu::KbRight)
  #   		@xS=@xS
  #   		@yS=@yS    	
  #   		@master.toState(self,"...");
  #   	else
  #   		@xS=@xS
  #   		@yS=@yS 
  #   		@master.toState(self,"...");
  #   	end;
  #    	if $g.button_down?(Gosu::KbSpace) || $g.button_down?(Gosu::KbUp)
		# 	@xS=@xS
  #   		@yS=@yS 
  #   	  	@master.toState(self,"...")	
  #   	end;	
    end;		
end;
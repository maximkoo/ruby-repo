class Explosion
	FRAME_DELAY=10
	attr_reader :out
	def initialize(x,y, a)
		@x=x; @y=y; @cfn=0; @out=false
		#@animation||=Gosu::Image.load_tiles('./exp2_0_50.png', 128/4,128/4);
		@animation=a
	end;	

	# def animation
		
	# end;
	
	def update
		now=Gosu.milliseconds;
    	if (now-(@last_update||=0)).to_f>FRAME_DELAY
      		@cfn+=1	
    		@last_update=now
    		@out=true if @cfn>=@animation.size
    	end;
	end;

	def done?
		return @cfn==@animation.size;		
	end;	

	def draw
		return if done?
		img=@animation[@cfn % @animation.size];
		img.draw(@x-img.width/2, @y-img.height/2, 50);
	end;
end;		
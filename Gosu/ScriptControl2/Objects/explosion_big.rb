class Explosion<GameObject
	FRAME_DELAY=10
  attr_accessor :x,:y, :object_pool,:expired
  def initialize(object_pool, x,y, big_small=:big)
    super(object_pool) 

    #@x,@y,@angle, @xDraw,@yDraw=x,y,angle,x,y
    @x,@y=x,y
    @cfn=0; 
    @expired=false
    if big_small==:big
      @animation=$explosion_animation_big
    else
      @animation=$explosion_animation_small
    end;  
  end;

  def update
	now=Gosu.milliseconds;
    if (now-(@last_update||=0)).to_f>FRAME_DELAY
    	@cfn+=1	
    	@last_update=now
    	@expired=true if @cfn>=@animation.size
    end;
  end;
  
  	def draw
		return if @cfn==@animation.size;
		img=@animation[@cfn % @animation.size];
		img.draw(@x-img.width/2, @y-img.height/2, 50);
    end;
end;    
#require 'game_object.rb'
class BossCrash<GameObject
FRAME_DELAY=10
  attr_accessor :x,:y, :object_pool,:expired
  def initialize(object_pool, x,y, angle, crash_anim)
    super(object_pool) 
    @x,@y, @angle=x,y, angle
    @cfn=0; 
    @expired=false
    @crash_anim=crash_anim

    @prt=[]
    @crash_anim.size.times do |a|
    	s={x:x, y:y, angle:angle, speed:rand(5)+1, direction: rand(360), angspeed:rand(40)+10}
    	@prt<<s
    end

    @poly=[]
    #@speeds=[]
    #@anglespeeds=[] 
    @sc=SCALER
  end;

  def update
  	@prt.each do |p|
  		p[:x]+=p[:speed]*Math.cos(p[:direction]);
  		p[:y]+=p[:speed]*Math.sin(p[:direction]);
  		p[:angle]+=p[:angspeed]
  	end;	
  	@sc-=0.002
  	#@sc+=0.01
  	@expired=true if @sc<=0
  end;
  
  def draw
  	@prt.each_with_index do |c, idx|
  		ang=Math::PI*c[:angle].fdiv(180)
  		@crash_anim[idx].draw_rot(c[:x],c[:y],GRAPHICS_LAYER,ang,0.5,0.5,@sc, @sc)#SCALER, SCALER) #if DRAW_GRAPHICS
  	end;
  end;	
end;    
require './boss.rb'
require './objects/boss1_crash.rb'
require_relative './laser_blue01.rb'
class Boss1<Boss
	SPEED=0
	ANGSPEED=0.2;
    SHOOT_DELAY=200
    def initialize(object_pool, x,y, angle, obj_id)
        @img=$boss1;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        @health=150;

        @poly=[]
        @poly<<{x:116,y:0}
        @poly<<{x:166,y:0}
        @poly<<{x:162,y:78}
        @poly<<{x:274,y:78}
        @poly<<{x:274,y:124}
        @poly<<{x:162,y:124}
        @poly<<{x:162,y:284}
        @poly<<{x:154,y:390}
        @poly<<{x:142,y:400}
        @poly<<{x:130,y:390}
        @poly<<{x:122,y:284}
        @poly<<{x:122,y:124}
        @poly<<{x:0,y:124}
        @poly<<{x:0,y:80}
        @poly<<{x:120,y:78}
        @poly.map!{|m|{x:m[:x]*2,y:m[:y]*2}}
        super(object_pool, x,y, angle, obj_id)
    end;

    def destruct
    	10.times do
    		ang=Math::PI*@angle.fdiv(180)
    		Explosion.new(@object_pool,@x+Math.cos(ang)*0.5*(rand(@img.width)-@img.width/2),@y+Math.sin(ang)*(rand(@img.height)-@img.height/2))
    	end;
    	Boss1Crash.new(@object_pool, @x, @y, @angle);
    end;

end;        
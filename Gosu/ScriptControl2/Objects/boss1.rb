require './boss.rb'
require_relative './laser_blue01.rb'
class Boss1<Boss
	SPEED=0
	ANGSPEED=0.5;
    SHOOT_DELAY=200
    def initialize(object_pool, x,y, angle, obj_id)
        @img=$boss1;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

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
        super(object_pool, x,y, angle, obj_id)
    end;
end;        
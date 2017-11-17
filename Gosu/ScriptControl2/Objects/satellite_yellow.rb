class SatelliteYellow<Enemy
    SPEED=15;
    ANGSPEED=10;
    def initialize(object_pool, x,y, angle, obj_id)
        @img=$satellite_yellow;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        
        @poly=[]
        @poly<<{x:0,y:0}
        @poly<<{x:85,y:0}
        @poly<<{x:85,y:25}
        @poly<<{x:0,y:25}

        puts @score

        super(object_pool, x,y, angle, obj_id)
        @score=5;
    end; 

    def shoot
        
    end;     
end;  
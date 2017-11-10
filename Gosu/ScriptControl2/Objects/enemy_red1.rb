class EnemyRed1<Enemy
    SPEED=6;
    ANGSPEED=10;
    SHOOT_DELAY=1000
    def initialize(object_pool, x,y, angle, obj_id)
        @img=$enemy_red1;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        @poly=[]
        @poly<<{x:22,y:0}
        @poly<<{x:36,y:5}
        @poly<<{x:56,y:5}
        @poly<<{x:70,y:0}
        @poly<<{x:92,y:58}
        @poly<<{x:74,y:82}
        @poly<<{x:56,y:74}
        @poly<<{x:36,y:74}
        @poly<<{x:18,y:82}
        @poly<<{x:1,y:58}

        super(object_pool, x,y, angle, obj_id)
    end; 

    def shoot
        now=Gosu.milliseconds
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserRed01.new(@object_pool, @x,@y,@angle, self)
        @last_update=now
    end;     
end;    
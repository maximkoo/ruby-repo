class EnemyRed2<Enemy
	SPEED=6;
    ANGSPEED=8;
    SHOOT_DELAY=500
	def initialize(object_pool, x,y, angle, obj_id)
        @img=$enemy_red2;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

		@poly=[]
		@poly<<{x:28,y:0}
		@poly<<{x:76,y:0}
		@poly<<{x:104,y:50}
		@poly<<{x:104,y:56}
		@poly<<{x:86,y:56}
		@poly<<{x:52,y:84}
		@poly<<{x:18,y:56}
		@poly<<{x:0,y:56}
		@poly<<{x:0,y:50}
	super(object_pool, x,y, angle, obj_id)
    end; 

    def shoot
        now=Gosu.milliseconds
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserBlue01.new(@object_pool, @x,@y,@angle, self)
        @last_update=now
    end;    
end;    
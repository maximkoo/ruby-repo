class EnemyRed3<Enemy
	SPEED=5;
    ANGSPEED=5;
    SHOOT_DELAY=300
	def initialize(object_pool, x,y, angle, obj_id)
        @img=$enemy_red3;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

		@poly=[]
		@poly<<{x:13,y:0}
		@poly<<{x:23,y:2}
		@poly<<{x:42,y:8}
		@poly<<{x:60,y:8}
		@poly<<{x:78,y:2}
		@poly<<{x:88,y:0}
		@poly<<{x:104,y:44}
		@poly<<{x:78,y:78}
		@poly<<{x:60,y:84}
		@poly<<{x:42,y:84}
		@poly<<{x:24,y:78}
		@poly<<{x:0,y:44}
	super(object_pool, x,y, angle, obj_id)
    end; 

    def shoot
        now=Gosu.milliseconds
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserBlue01.new(@object_pool, @x,@y,@angle, self)
        @last_update=now
    end;    
end; 
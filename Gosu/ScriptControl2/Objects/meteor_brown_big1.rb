require './idle.rb'
class MeteorBrownBig1<Idle
	SPEED=0
	ANGSPEED=0.5
	def initialize(object_pool, x,y, angle)
		@img=$meteor_brown_big1;

		@xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

		@poly=[]
        @poly<<{x:17, y:2}
        @poly<<{x:74, y:2}
        @poly<<{x:99, y:39}
        @poly<<{x:82, y:74}
        @poly<<{x:62, y:70}
        @poly<<{x:29, y:81}
        @poly<<{x:2, y:51}

        super(object_pool, x,y, angle)
	end;

	def shoot #типа переопределенный
        now=Gosu.milliseconds
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserBlue01.new(@object_pool, @x,@y,@angle, self)
        @last_update=now
    end;
end;	
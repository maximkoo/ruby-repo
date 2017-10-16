require './Components/component.rb'
require './routine_holder.rb'
class PhysicsComponent<Component
    attr_accessor :x, :y, :speed, :angle
    def initialize(obj)
        super(obj)
        @x,@y,@angle=@object.x,@object.y,@object.angle
    end;

    def move
        #@object.x=@object.x+@object.speed*Math::sin(@object.angle*Math::PI.fdiv(180));
        @x=@x+@object.class::SPEED*Math::sin(@angle*Math::PI.fdiv(180));
        #@object.y=@object.y-@object.speed*Math::cos(@object.angle*Math::PI.fdiv(180)); 
        @y=@y-@object.class::SPEED*Math::cos(@angle*Math::PI.fdiv(180)); 
        #puts @object.x, @object.y
    end;   

    def stop
        @speed=0

    end;
        
    def rotate

    end;

    def rotate_left
        @angle-=@object.class::ANGSPEED
    end;    

    def rotate_right
        @angle+=@object.class::ANGSPEED
    end;

    def shoot
        now=Gosu.milliseconds
       # puts now-@last_update||=0
        return if (now-@last_update||=0)<@object.class::SHOOT_DELAY
        #LaserBlue01.new(@object.object_pool, @x,@y,@angle, @object)
        #puts "PEW!"
        @last_update=now
    end;    

    def shootDown

    end;

	 def destruct
        puts "DESTRUCT!!!!11"
        @object.destruct;
    end; 

    # def update
    # 	@object.x,@object.y,@object.angle=@x,@y,@angle
    # end;	

    # контроллер выполнения скриптов
    def update   
        @routine=RoutineHolder.new.routine(@object.obj_id,@object.cr)
        @routine.call(self) if !@routine.nil?
        @object.x,@object.y,@object.angle=@x,@y,@angle
    end;   

    def next
        @object.cr+=1;
    end; 

    def rewind
        #puts :rewind
        @object.cr=0;
    end; 
end;    
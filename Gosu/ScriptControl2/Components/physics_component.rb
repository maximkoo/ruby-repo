require './Components/component.rb'
require './routine_holder.rb'
class PhysicsComponent<Component
    attr_accessor :x, :y, :speed, :angle, :mileage
    def initialize(obj)
        super(obj)
        @x,@y,@angle,@mileage=@object.x,@object.y,@object.angle,@object.mileage
    end;

    def move
        #@object.x=@object.x+@object.speed*Math::sin(@object.angle*Math::PI.fdiv(180));
        @x=@x+@object.class::SPEED*Math::sin(@angle*Math::PI.fdiv(180));
        #@object.y=@object.y-@object.speed*Math::cos(@object.angle*Math::PI.fdiv(180)); 
        @y=@y-@object.class::SPEED*Math::cos(@angle*Math::PI.fdiv(180)); 
        #puts @object.x, @object.y
        @mileage+=@object.class::SPEED
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
        # now=Gosu.milliseconds
        # return if (now-@last_update||=0)<@object.class::SHOOT_DELAY
        # @last_update=now
        @object.shoot;
    end;    

    def shootDown

    end;

	 def destruct
        @object.destruct;
    end; 

    # def update
    # 	@object.x,@object.y,@object.angle=@x,@y,@angle
    # end;	

    # контроллер выполнения скриптов
    def update   
        @routine=RoutineHolder.new.routine(@object.obj_id,@object.cr)
        #@routine.call(self) if !@routine.nil?
        if !@routine.nil?
            @routine.call(self)
        else
            move;
        end;    
        @object.x,@object.y,@object.angle,@object.mileage=@x,@y,@angle,@mileage
    end;   

    def next
        @object.cr+=1;
    end; 

    def rewind
        #puts :rewind
        @object.cr=0;
    end; 
end;    
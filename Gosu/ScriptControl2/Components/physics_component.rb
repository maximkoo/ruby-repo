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

    def move_back
        #@object.x=@object.x+@object.speed*Math::sin(@object.angle*Math::PI.fdiv(180));
        @x=@x-@object.class::SPEED*Math::sin(@angle*Math::PI.fdiv(180));
        #@object.y=@object.y-@object.speed*Math::cos(@object.angle*Math::PI.fdiv(180)); 
        @y=@y+@object.class::SPEED*Math::cos(@angle*Math::PI.fdiv(180)); 
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
    
    def strafe_left
        @x-=@object.class::SPEED
    end;
    
    def strafe_right
         @x+=@object.class::SPEED
    end;

    def strafe_tilt_left
        @angle=360-@object.class::TILT
        @x-=@object.class::SPEED
    end;

    def strafe_tilt_right
        @angle=@object.class::TILT
        @x+=@object.class::SPEED
    end;        

    def float
        @y-=GAME_SPEED;
        @mileage+=GAME_SPEED
    end;   

    def look_up
        @angle=0;
    end; 

    def look_down
        @angle=180;
    end; 

    def rotate_left_slow
        @angle-=@object.class::ANGSPEED/10
    end;   

    def rotate_right_slow
        @angle+=@object.class::ANGSPEED/10
    end;

    # контроллер выполнения скриптов
    def update   
        @routine=RoutineHolder.new.routine(@object.obj_id,@object.cr)
        #@routine.call(self) if !@routine.nil?
        if !@routine.nil?
            @routine.call(self)
        else
            #move;
            @object.default_routine;
        end;    
        @y+=GAME_SPEED;
        if @object.class==Player && @y>=$window_height-30
                #puts "TROLOLOLO"
                @y=$window_height-30
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
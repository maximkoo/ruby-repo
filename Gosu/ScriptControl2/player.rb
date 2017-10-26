require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
class Player<GameObject
	SHOOT_DELAY=100;
	SPEED=5 #left right up down
	TILT=10
	attr_reader :object_pool, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter
    attr_accessor :health, :mileage
    attr_accessor :hits, :source # для Collider
    def initialize(object_pool, x,y, angle) 
    	super(object_pool)        
        @x,@y,@angle=x,y,angle

        @health=10;
        @hits=[]

        @img=$player_ship;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        @poly=[]
        @poly<<{x:40,y:0}
        @poly<<{x:56,y:0}
        @poly<<{x:60,y:26}
        @poly<<{x:86,y:38}
        @poly<<{x:98,y:32}
        @poly<<{x:96,y:62}
        @poly<<{x:64,y:64}
        @poly<<{x:58,y:74}
        @poly<<{x:42,y:74}
        @poly<<{x:36,y:64}
        @poly<<{x:2,y:62}
        @poly<<{x:0,y:32}
        @poly<<{x:14,y:38}
        @poly<<{x:38,y:26}
        ### Компоненты ###
        @ph=PhysicsComponent.new(self);
        @gr=GraphicsComponent.new(self);
        @pl=PolygonComponent.new(self);
        @co=ColliderComponent.new(self)

    end;

    def update
         components.each(&:update)  
        # destruct if !@hits.nil?   
        key_control;  
        destruct if !@hits.nil?  
    end;

    def draw
        #puts "Components draw"
        components.each(&:draw)
    end;

    def shoot
        now=Gosu.milliseconds
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserBlue01.new(@object_pool, @x,@y,@angle, self)
        @last_update=now
    end;  

    def key_control
    	if $g.button_down?(Gosu::KB_A)
    		shoot;
    	end;

    	if $g.button_down?(Gosu::KbSpace)
    		shoot;
    	end
    	if $g.button_down?(Gosu::KbLeft)
    		@ph.strafe_tilt_left;
    	elsif $g.button_down?(Gosu::KbRight)
    		@ph.strafe_tilt_right;
    	else
    		@ph.look_up;	
    	end;
    	if $g.button_down?(Gosu::KbUp)
    		@ph.move;
    	end;
    	if $g.button_down?(Gosu::KbDown)
    		@ph.move_back;
    	end;
    end;

    def inflict_loss(damage, another_object)
        @health-=damage;
        puts "#{self.class} health=#{@health}"
        destruct if @health<=0
    end;    

    def destruct
        puts "#{self.class} DESTRUCT!"
        Explosion.new(@object_pool,@x,@y)
        @expired=true;
    end;  	
end;
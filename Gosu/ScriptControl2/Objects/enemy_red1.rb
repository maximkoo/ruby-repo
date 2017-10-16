#require './Components/script_controller.rb'
require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
class EnemyRed1<GameObject
    SPEED=15;
    ANGSPEED=10;
    SHOOT_DELAY=300
    attr_reader :object_pool, :poly, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter, :expired
    def initialize(object_pool, x,y, angle, obj_id)
        super(object_pool) 
        @x,@y,@angle=x,y,angle
        @expired=false; 
        @obj_id=obj_id

        @img=$enemy_red1;

        #puts "@img.width=#{@img.width}"
        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        @cr=0;

        @poly=[]
        @poly<<{x:15,y:0}
        @poly<<{x:36,y:8}
        @poly<<{x:56,y:8}
        @poly<<{x:74,y:0}
        @poly<<{x:92,y:26}
        @poly<<{x:70,y:82}
        @poly<<{x:56,y:78}
        @poly<<{x:36,y:78}
        @poly<<{x:22,y:82}
        @poly<<{x:0,y:26}

        @ph=PhysicsComponent.new(self);
        #@co=ScriptController.new(self)
        @gr=GraphicsComponent.new(self);
         #puts "Components=#{components}";
        @pl=PolygonComponent.new(self);  

        #puts @components 
    end;

    def update
         components.each(&:update)        
    end;

    def draw
        #puts "Components draw"
        components.each(&:draw)
    end; 
end;    
#require './Components/script_controller.rb'
require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
require './enemy.rb'
class EnemyRed1<Enemy
    SPEED=10;
    ANGSPEED=10;
    SHOOT_DELAY=300
    def initialize(object_pool, x,y, angle, obj_id)
        @img=$enemy_red1;

        @xCenter=@img.width.fdiv(2)
        @yCenter=@img.height.fdiv(2)

        @poly=[]
        @poly<<{x:22,y:0}
        @poly<<{x:36,y:5}
        @poly<<{x:56,y:5}
        @poly<<{x:70,y:0}
        @poly<<{x:92,y:56}
        @poly<<{x:74,y:82}
        @poly<<{x:56,y:74}
        @poly<<{x:36,y:74}
        @poly<<{x:18,y:82}
        @poly<<{x:0,y:56}

        super(object_pool, x,y, angle, obj_id)
    end;    
end;    
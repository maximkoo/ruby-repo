require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
class Enemy<GameObject
	attr_reader :object_pool, :poly, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter, :expired
    def initialize(object_pool, x,y, angle, obj_id)
        super(object_pool) 
        @x,@y,@angle=x,y,angle

        ## Начальные значения ##
        @expired=false; 
        @cr=0;
        @obj_id=obj_id

        ### Компоненты ###
        @ph=PhysicsComponent.new(self);
        @gr=GraphicsComponent.new(self);
        @pl=PolygonComponent.new(self);
    end;

    def update
         components.each(&:update)        
    end;

    def draw
        #puts "Components draw"
        components.each(&:draw)
    end; 
end;        
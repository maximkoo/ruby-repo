require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
class BossPart<GameObject
	attr_reader :object_pool, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter
    attr_accessor :health, :mileage
    def initialize(object_pool, x,y, angle, obj_id)
        super(object_pool) # это не настоящий ObjectPool!

        @x,@y,@angle=x,y,angle

        @health=10;

        ## Начальные значения ##
        @cr=0;
        @obj_id=obj_id

        ### Компоненты ###
        @ph=PhysicsComponent.new(self);
        @gr=GraphicsComponent.new(self);
        #@pl=PolygonComponent.new(self);
    end;
end;        
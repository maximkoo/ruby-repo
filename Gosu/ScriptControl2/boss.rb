require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
require './boss_part.rb'
class Boss<GameObject
	attr_reader :object_pool, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter
    attr_accessor :health, :mileage
    def initialize(object_pool, x,y, angle, obj_id)
        super(object_pool) 
        @x,@y,@angle=x,y,angle

        ## Начальные значения ##
        @cr=0;
        @obj_id=obj_id

        ### Компоненты ###
        @ph=PhysicsComponent.new(self);
        @gr=GraphicsComponent.new(self);
        @pl=PolygonComponent.new(self);

        @parts=[]        
    end;

    def inflict_loss(damage, another_object)
    	@health-=damage;
    	puts health
    	if @health<=0
    		@expired=true;    	    	
    		destruct;
    	end;
    end;	

    def update # update each part
    	components.each(&:update) 
    end;

    def draw # draw each part rotated around a common center
    	 components.each(&:draw)
    end;
end;    

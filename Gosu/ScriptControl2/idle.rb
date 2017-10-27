class Idle<GameObject
    attr_reader :object_pool, :poly, :img
    attr_accessor :x,:y,:angle, :xCenter,:yCenter
    def initialize(object_pool, x,y, angle)
	    super(object_pool) 

	    @x,@y,@angle=x,y,angle

	    @gr=GraphicsComponent.new(self);
	    @pl=PolygonComponent.new(self);
	end;

	def update
        components.each(&:update)     
        @y+=GAME_SPEED   
    end;

    def draw
        components.each(&:draw)
    end;
end;	    

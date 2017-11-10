require './utils.rb'
# require './Components/physics_component.rb'
# require './Components/graphics_component.rb'
# require './Components/polygon_component.rb'
# require './Components/collider_component.rb'
class Laser<GameObject
    attr_reader :object_pool, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter
    attr_accessor :hits, :source # для Collider
    DAMAGE=10
    def initialize(object_pool, x,y, angle, source)
	    super(object_pool) 

		  @source=source
	    @x,@y,@angle=x,y,angle
      @hits=[]

	    ## Начальные значения ##
	   # @expired=false; 

	    ### Компоненты ###
	    @ph=PhysicsComponent.new(self);
	    @gr=GraphicsComponent.new(self);
	    @pl=PolygonComponent.new(self);
      @po=ColliderComponent.new(self);
	end;

	def update
        components.each(&:update)   

        if !@hits.nil?
          if  (@source.class==Player) || (hits[0][:another_object].class==Player) ||(FRIENDLY_FIRE && hits[0][:another_object].class!=Player)
            destruct; 
          end;         
        end;  

        @expired=true if (@y<-50) || (@y>$window_height+50) || (@x<-50) || (@x>$window_width+50) 
    end;

    def draw
        components.each(&:draw)
    end; 

    def destruct
      #puts :Explosion
      #puts "@source.class=#{@source.class}"
      #puts "hits[0][:another_object]=#{hits[0][:another_object]}"


      
          hits[0][:another_object].inflict_loss(DAMAGE,self);
          
          if !hits[0][:another_object].expired
            Explosion.new(@object_pool,@hits[0][:x],@hits[0][:y],:small)
            #puts @hits[0][:x],@hits[0][:y]
          end; 
          @expired=true;
    end;  

    def default_routine
        @ph.move;
    end;    
end;    


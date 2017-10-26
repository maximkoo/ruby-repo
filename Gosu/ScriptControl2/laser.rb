require './utils.rb'
require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
require './Components/collider_component.rb'
require './Objects/Explosion_big.rb'
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
          destruct;          
        end;  
        # hit=check_hit
        # if !hit.nil?; #--<<--
        #   puts :Explosion
        #   Explosion.new(@object_pool,hit[0][:x],hit[0][:y])
        #   destruct;
        #   #xxx=hit[0][:another_object]
        #   #xxx.inflict_loss(self)
        # end;      
    end;

    def draw
        components.each(&:draw)
    end; 

    def destruct
      #puts :Explosion
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

    # private
    # def check_hit
    #   res=nil;
    #   @object_pool.nearby(self).each do |obj|
    #     next if obj==self || obj==@source
    #     # puts "Object nearby detected: #{obj}"
    #     # puts "p1=#{self.poly}"
    #     # puts "p2=#{obj.poly}"
    #     if Utils.polygons_intersect?(self.poly, obj.poly)
    #       puts "HIT DETECTED!!!!"
    #       res=Utils.polygons_intersections(self.poly, obj.poly)
    #       #puts res.to_s
    #        res.each {|r| r[:another_object]=obj} 
    #       @expired=true;
    #     end;  
    #   end
    #   return res
    # end;
end;    


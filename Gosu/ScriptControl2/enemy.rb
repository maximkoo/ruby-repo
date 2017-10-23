require './Components/physics_component.rb'
require './Components/graphics_component.rb'
require './Components/polygon_component.rb'
class Enemy<GameObject
	attr_reader :object_pool, :obj_id, :img, :ph
    attr_accessor :x,:y,:angle, :cr, :xCenter,:yCenter
    attr_accessor :health, :mileage
    attr_accessor :hits, :source # для Collider
    def initialize(object_pool, x,y, angle, obj_id)
        super(object_pool) 
        @x,@y,@angle=x,y,angle

        @health=10;
        @hits=[]

        ## Начальные значения ##
       # @expired=false; 
        @cr=0;
        @obj_id=obj_id

        ### Компоненты ###
        @ph=PhysicsComponent.new(self);
        @gr=GraphicsComponent.new(self);
        @pl=PolygonComponent.new(self);
        @co=ColliderComponent.new(self)
    end;

    def update
         components.each(&:update)  

         destruct if !@hits.nil?      
    end;

    def draw
        #puts "Components draw"
        components.each(&:draw)
    end; 

     def shoot
    #     now=Gosu.milliseconds
    #     return if (now-@last_update||=0)<SHOOT_DELAY
    #     LaserBlue01.new(@object_pool, @x,@y,@angle, self)
    #     @last_update=now
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
require './component.rb'
require './laserBlue01.rb'
SHOOT_DELAY=300
class SpaceShips_001<GameObject
    attr_accessor :x,:y, :speed, :angle, :cr, :object_pool
    def initialize(object_pool, x,y, angle)
        super(object_pool) 
        @x,@y,@angle=x,y,angle
        @ph=SpaceShips_001_physics.new(self);
        @gr=SpaceShips_001_graphics.new(self,x,y,angle);
        @pl=SpaceShips_001_polygon.new(self,x,y);
        puts @components  
    end;

    def destruct

    end;   

    def update
         components.each(&:update)
    end;
    
    def draw
        #puts "Components draw"
        components.map(&:draw)
    end;     
end;

class SpaceShips_001_physics<Component
    attr_accessor :x, :y, :speed, :angle
    def initialize(obj)
        super(obj)
        @x,@y,@angle=@object.x,@object.y,@object.angle
        @speed=10;
        @cr=0
        @obj_id=0
        puts @object.inspect
        puts "cr=#{@object.cr}"          
        #puts @object.x, @object.y    
        
    end;

    def move
        #@object.x=@object.x+@object.speed*Math::sin(@object.angle*Math::PI.fdiv(180));
        @x=@x+@speed*Math::sin(@angle*Math::PI.fdiv(180));
        #@object.y=@object.y-@object.speed*Math::cos(@object.angle*Math::PI.fdiv(180)); 
        @y=@y-@speed*Math::cos(@angle*Math::PI.fdiv(180)); 
        #puts @object.x, @object.y
    end;   

    def stop
        @speed=0

    end;
        
    def rotate

    end;

    def rotate_left
        @angle-=5
    end;    

    def rotate_right
        @angle+=5
    end;

    def shoot
        now=Gosu.milliseconds
       # puts now-@last_update||=0
        return if (now-@last_update||=0)<SHOOT_DELAY
        LaserBlue01.new(@object.object_pool, @x,@y,@angle)
        #puts "PEW!"
        @last_update=now
    end;    

    def shootDown

    end;    

    def update   
        #puts @cr
        @routine=RoutineHolder.new.routine(@obj_id,@cr)
        @routine.call(self) 
        @object.x,@object.y,@object.angle=@x,@y,@angle
        #puts @object.angle%360
    end;   

    def next
        @cr+=1;
    end; 

    def rewind
        #puts :rewind
        @cr=0;
    end;    
end;        

class SpaceShips_001_graphics<Component
    attr_accessor :img
    def initialize(obj, x,y,angle)
        super(obj)
        #@x,@y,@angle=x,y,angle
        #f=File.join("c:","Users","kopa","Documents","Ruby","Graphics","kenney_spaceShooterExtension","PNG","Sprites","Ships","spaceShips_001.png")
        f='./spaceShips_001_50.png';
        @img=Gosu::Image.new(f);
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle)
    end;        
end;

class SpaceShips_001_polygon<Component
    attr_accessor :poly
    def initialize(obj,x,y)
        super(obj)
        @x,@y=x,y
        @poly=[]
        @poly<<{:x=>27, :y=>0}
        @poly<<{:x=>47, :y=>0}
        @poly<<{:x=>47, :y=>7}
        @poly<<{:x=>57, :y=>7}
        @poly<<{:x=>57, :y=>0}
        @poly<<{:x=>77, :y=>0}
        @poly<<{:x=>77, :y=>4}
        @poly<<{:x=>93, :y=>9}
        @poly<<{:x=>105, :y=>56}
        @poly<<{:x=>82, :y=>80}
        @poly<<{:x=>74, :y=>75}
        #здесь пропуск
        @poly<<{:x=>68, :y=>44}
        @poly<<{:x=>61, :y=>63}
        @poly<<{:x=>44, :y=>63}
        @poly<<{:x=>37, :y=>44}
        #здесь пропуск
        @poly<<{:x=>30, :y=>75}
        @poly<<{:x=>23, :y=>80}
        @poly<<{:x=>0, :y=>56}
        @poly<<{:x=>13, :y=>9}
        @poly<<{:x=>27, :y=>4}

        @poly<<@poly.first.clone;
        @poly.each{|p| p[:x]=p[:x].fdiv(2)+x; p[:y]=p[:y].fdiv(2)+y;}
    end;

    def draw

    end;    
end;     
require './component.rb'
require './laserBlue01.rb'
SHOOT_DELAY=300
class SpaceShips_001<GameObject
    attr_accessor :x,:y, :speed, :angle, :cr, :object_pool, :xCenter, :yCenter, :expired, :poly
    def initialize(object_pool, x,y, angle)
        super(object_pool) 
        @x,@y,@angle=x,y,angle
        @ph=SpaceShips_001_physics.new(self);
        @gr=SpaceShips_001_graphics.new(self);
        @pl=SpaceShips_001_polygon.new(self);        
        puts @components 
        @expired=false; 
    end;

    def destruct

    end;   

    def update
         components.each(&:update)
    end;
    
    def draw
        #puts "Components draw"
        components.each(&:draw)
    end;   

    def poly
        @pl.poly
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
        @routine.call(self) if !@routine.nil?
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
    def initialize(obj)
        super(obj)
        #f=File.join("c:","Users","kopa","Documents","Ruby","Graphics","kenney_spaceShooterExtension","PNG","Sprites","Ships","spaceShips_001.png")
        f='./spaceShips_001_50.png';
        @img=Gosu::Image.new(f);
        @object.xCenter=@img.width.fdiv(2)
        @object.yCenter=@img.height.fdiv(2)
        puts @object.xCenter, @object.yCenter
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle) if DRAW_GRAPHICS
    end;        
end;

class SpaceShips_001_polygon<Component
    attr_accessor :poly
    def initialize(obj)
        super(obj)
        #@x,@y=x,y
        @poly0=[]
        @poly0<<{:x=>9, :y=>0}
        @poly0<<{:x=>21, :y=>7}
        @poly0<<{:x=>29, :y=>7}
        @poly0<<{:x=>41, :y=>0}
        @poly0<<{:x=>51, :y=>11}
        @poly0<<{:x=>45, :y=>35}
        @poly0<<{:x=>37, :y=>38}
        @poly0<<{:x=>12, :y=>38}
        @poly0<<{:x=>5, :y=>35}
        @poly0<<{:x=>0, :y=>11}

        @poly0<<@poly0.first.clone;   
        @poly=@poly0.clone   
        @poly=@poly0.map{|p| {:x=>p[:x]+@object.x-@object.xCenter, :y=>p[:y]+@object.y-@object.yCenter}}
    end;

    def update
        ang=Math::PI*@object.angle.fdiv(180)
        xc,yc=@object.xCenter, @object.yCenter;

        @poly1=@poly0.map{|p| {:x=>(p[:x]-xc)*Math.cos(ang)-(p[:y]-yc)*Math.sin(ang), :y=>(p[:x]-xc)*Math.sin(ang)+(p[:y]-yc)*Math.cos(ang)}}
        @poly=@poly1.map{|p| {:x=>p[:x]+@object.x, :y=>p[:y]+@object.y}}
    end;
        
    def draw
        if DRAW_POLYGONS
            (@poly.size-1).times do |i|
                #puts "poly=#{@poly}"
                Gosu.draw_line(@poly[i][:x],@poly[i][:y],Gosu::Color::WHITE, @poly[i+1][:x],@poly[i+1][:y],Gosu::Color::GRAY,POLYGON_LAYER);                
            end
        #puts :draw_line
        end;    
    end;    
end;     
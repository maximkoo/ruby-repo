class LaserBlue01<GameObject
  attr_accessor :x,:y, :speed, :angle
  def initialize(object_pool, x,y, angle)
    super(object_pool) 

    @x,@y,@angle=x,y,angle     

    @ph=LaserBlue01_physics.new(self);
    @gr=LaserBlue01_graphics.new(self,x,y,angle);
    @pl=LaserBlue01_polygon.new(self,x,y);
    #puts @components  
  end

  def update
         components.each(&:update)
    end;
    
    def draw
        components.map(&:draw)
    end; 
end;

class LaserBlue01_physics<Component
  def initialize(obj)
    super(obj)
    @x,@y,@angle=@object.x,@object.y,@object.angle
    @speed=30;
    #puts @x,@y,@angle
  end;  

  def update
    #puts "SHOOT!!!"
    dx=@speed*Math::sin(@angle*Math::PI.fdiv(180))
    dy=@speed*Math::cos(@angle*Math::PI.fdiv(180))
    @x=@x+dx;
    @y=@y-dy;
    @object.x,@object.y=@x,@y  
  end
end;

class LaserBlue01_graphics<Component
  def initialize(obj,x,y,angle)
    super(obj)
    #f=File.join("C:","Users","kopa","Documents","Ruby","Graphics","Space Shooter","PNG","Lasers","laserBlue01.png")
    f='./laserBlue01.png'
    @img=Gosu::Image.new(f);
  end;
  
  def update
  end;

  def draw
    #puts @object.x,@object.y,GRAPHICS_LAYER,@object.angle
    @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle)
  end;  
end;  

class LaserBlue01_polygon<Component
  def initialize(obj,x,y)
    super(obj)
  end;
end;
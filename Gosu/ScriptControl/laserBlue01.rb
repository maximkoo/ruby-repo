class LaserBlue01<GameObject
  attr_accessor :x,:y, :speed, :angle, :object_pool,:expired
  def initialize(object_pool, x,y, angle)
    super(object_pool) 

    @x,@y,@angle=x,y,angle     

    @ph=LaserBlue01_physics.new(self);
    @pl=LaserBlue01_polygon.new(self,x,y);
    @gr=LaserBlue01_graphics.new(self,x,y,angle);
    
    #puts @components  
    @expired=false;
  end

  def update
         components.each(&:update)
    end;
    
    def draw
        components.map(&:draw)
    end; 

    def poly
        @pl.poly
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

    dx=@speed*Math::sin(@angle*Math::PI.fdiv(180))
    dy=@speed*Math::cos(@angle*Math::PI.fdiv(180))
    @x=@x+dx;
    @y=@y-dy;

    check_hit; #--<<--
    return if @object.expired

    @object.x,@object.y=@x,@y  

    
  end

  private
  def check_hit
    #puts :check_hit
    #puts @object
    @object.object_pool.nearby(@object).each do |obj|
      next if obj==@object || obj.class==SpaceShips_001
      puts "Object nearby detected: #{obj}"
      #sleep(0.5)
      #puts @object.poly
      #puts ":::"
      #puts obj.poly
      if Utils.polygons_intersect?(@object.poly, obj.poly)
        puts "HIT DETECTED!!!!"
        puts Utils.polygons_intersections(@object.poly, obj.poly).to_s

        @object.expired=true;
      end;  
    end
  end;  
end;

class LaserBlue01_graphics<Component
  def initialize(obj,x,y,angle)
    super(obj)
    f=File.join("C:","Users","kopa","Documents","Ruby","Graphics","Space Shooter","PNG","Lasers","laserBlue01.png")
    @img=Gosu::Image.new(f);
  end;
  
  def update
  end;

  def draw
    #puts @object.x,@object.y,GRAPHICS_LAYER,@object.angle
    if !@object.expired
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle) if DRAW_GRAPHICS
    end;    
  end;  
end;  

class LaserBlue01_polygon<Component
  attr_reader :poly
  def initialize(obj,x,y)
    super(obj)
    @poly=[{x:x,y:y},{x:x,y:y}] # - начало - конец ->
  end;

  def update
    a=@poly.last[:x]
    b=@poly.last[:y]
    #@poly=[@poly.last,{x:@object.x, y:@object.y}]
    @poly=[{x:a,y:b},{x:@object.x, y:@object.y}]
    #puts @poly.to_s
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
    
  def poly
    @poly
  end;  
end;
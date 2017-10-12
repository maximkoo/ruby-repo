class LaserBlue01<GameObject
  attr_accessor :x,:y, :speed, :angle, :object_pool,:expired, :xCenter, :yCenter, :source
  def initialize(object_pool, x,y, angle, source)
    super(object_pool) 

@source=source
    #@x,@y,@angle, @xDraw,@yDraw=x,y,angle,x,y
    @x,@y,@angle=x,y,angle

    dx=54*Math::sin(@angle*Math::PI.fdiv(180))
    dy=54*Math::cos(@angle*Math::PI.fdiv(180))
    @x=@x+dx;
    @y=@y-dy;

    @ph=LaserBlue01_physics.new(self);
    @pl=LaserBlue01_polygon.new(self,@x,@y);
    @gr=LaserBlue01_graphics.new(self,@x,@y,angle);
    
    #puts @components  
    @expired=false;
  end

  def update
        components.each(&:update)
        hit=check_hit
        if !hit.nil?; #--<<--
          puts :Explosion
          #Explosion.new(@object_pool,hit[0][:x],hit[0][:y])
          destruct;
          xxx=hit[0][:another_object]
          xxx.inflict_loss(self)
        end;  
    end;
    
    def draw
        components.map(&:draw)
    end; 

    def poly
        @pl.poly
    end;

    def inflict_loss(another_object)
        puts "#{self} is it by another object #{another_object}"
        destruct;        
    end;

    def destruct
        Explosion.new(@object_pool, @x,@y);
        @expired=true;
    end;

    private
    def check_hit
      res=nil;
      @object_pool.nearby(self).each do |obj|
        next if obj==self || obj==source #|| obj.class==SpaceShips_001
        #puts "Object nearby detected: #{obj}"
        if Utils.polygons_intersect?(self.poly, obj.poly)
          puts "HIT DETECTED!!!!"
          res=Utils.polygons_intersections(self.poly, obj.poly)
          puts res.to_s
           res.each {|r| r[:another_object]=obj} 
          @expired=true;
        end;  
      end
      return res
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

    @object.x,@object.y=@x,@y  
    
  end    
end;

class LaserBlue01_graphics<Component
  def initialize(obj,x,y,angle)
    super(obj)
    f=File.join("C:","Users","kopa","Documents","Ruby","Graphics","Space Shooter","PNG","Lasers","laserBlue01.png")
    @img=Gosu::Image.new(f);
    @object.xCenter=@img.width.fdiv(2)
    @object.yCenter=@img.height.fdiv(2)
  end;
  
  def update
  end;

  def draw
    #puts @object.x,@object.y,GRAPHICS_LAYER,@object.angle
   # if !@object.expired
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle,0.5,0.1) if DRAW_GRAPHICS
        #@img.draw_rot(@object.xDraw,@object.yDraw,GRAPHICS_LAYER,@object.angle,0.5,0.1) if DRAW_GRAPHICS
   # end;    
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
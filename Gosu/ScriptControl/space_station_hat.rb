class SpaceStationHat<GameObject
attr_accessor :x,:y, :speed, :angle, :object_pool, :xCenter, :yCenter, :expired
    def initialize(object_pool, x,y, angle)
        super(object_pool) 
        @x,@y,@angle=x,y,angle
        @ph=SpaceStationHat_physics.new(self);
        @gr=SpaceStationHat_graphics.new(self);
        @pl=SpaceStationHat_polygon.new(self);        
        #puts @components 
        @expired=false; 

        puts @poly
    end;

    def update
        components.each(&:update)
    end;
    
    def draw
        components.each(&:draw)
    end;

    def poly
        @pl.poly
    end;
end;    

class SpaceStationHat_physics<Component
    attr_accessor :x, :y, :speed, :angle
    def initialize(obj)
        super(obj)
        @x,@y,@angle=@object.x,@object.y,@object.angle
        @speed=0;
        @obj_id=10
    end;

    def update
    	@object.angle-=0.5
    end;   
end;

class SpaceStationHat_graphics<Component
    attr_accessor :img
    def initialize(obj)
        super(obj)
        f='./Spacestationhat1.png';
        @img=Gosu::Image.new(f);
        @object.xCenter=@img.width.fdiv(2)
        @object.yCenter=@img.height.fdiv(4)
        #puts @object.xCenter, @object.yCenter
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle,0.5,0.25) if DRAW_GRAPHICS
    end;        
end;   

class SpaceStationHat_polygon<Component
    attr_accessor :poly
    def initialize(obj)
        super(obj)
        @poly0=[]
        @poly0<<{x:142,y:0}
        @poly0<<{x:174,y:9}
        @poly0<<{x:192,y:33}
        @poly0<<{x:203,y:33}
        @poly0<<{x:203,y:43}
        @poly0<<{x:172,y:50}
        @poly0<<{x:162,y:71}
        @poly0<<{x:164,y:108}
        @poly0<<{x:274,y:108}
        @poly0<<{x:274,y:152}
        @poly0<<{x:164,y:152}
        @poly0<<{x:155,y:217}
        @poly0<<{x:164,y:273}
        @poly0<<{x:164,y:317}
        @poly0<<{x:147,y:347}
        @poly0<<{x:154,y:419}
        @poly0<<{x:143,y:428}#lower tip
        @poly0<<{x:128,y:419}
        @poly0<<{x:137,y:347}
        @poly0<<{x:121,y:317}
        @poly0<<{x:121,y:273}
        @poly0<<{x:129,y:217}
        @poly0<<{x:121,y:152}
        @poly0<<{x:1,y:152}
		@poly0<<{x:1,y:108}
        @poly0<<{x:120,y:108}
        @poly0<<{x:120,y:71}
		@poly0<<{x:114,y:51}
		@poly0<<{x:80,y:43}
		@poly0<<{x:81,y:33}
		@poly0<<{x:91,y:33}
		@poly0<<{x:109,y:9}        
        @poly0<<@poly0.first.clone;
        #@poly=@poly.map{|p| {:x=>p[:x]+@object.x-@object.xCenter, :y=>p[:y]+@object.y-@object.yCenter}}
        ang=Math::PI*@object.angle.fdiv(180)
        xc,yc=@object.xCenter, @object.yCenter;

        @poly1=@poly0.map{|p| {:x=>(p[:x]-xc)*Math.cos(ang)-(p[:y]-yc)*Math.sin(ang), :y=>(p[:x]-xc)*Math.sin(ang)+(p[:y]-yc)*Math.cos(ang)}}
        @poly=@poly1.map{|p| {:x=>p[:x]+@object.x, :y=>p[:y]+@object.y}}
        #update;
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
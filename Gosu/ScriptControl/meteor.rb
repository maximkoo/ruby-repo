class Meteor<GameObject
    attr_accessor :x,:y, :speed, :angle, :object_pool, :xCenter, :yCenter, :expired
    def initialize(object_pool, x,y, angle)
        super(object_pool) 
        @x,@y,@angle=x,y,angle
        @ph=Meteor_physics.new(self);
        @gr=Meteor_graphics.new(self);
        @pl=Meteor_polygon.new(self);        
        puts @components 
        @expired=false; 
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

class Meteor_physics<Component
    attr_accessor :x, :y, :speed, :angle
    def initialize(obj)
        super(obj)
        @x,@y,@angle=@object.x,@object.y,@object.angle
        @speed=0;
        @obj_id=10
    end;   
end;

class Meteor_graphics<Component
    attr_accessor :img
    def initialize(obj)
        super(obj)
        f='./meteorBrown_big1.png';
        @img=Gosu::Image.new(f);
        @object.xCenter=@img.width.fdiv(2)
        @object.yCenter=@img.height.fdiv(2)
        #puts @object.xCenter, @object.yCenter
    end;  

    def draw
        @img.draw_rot(@object.x,@object.y,GRAPHICS_LAYER,@object.angle) if DRAW_GRAPHICS
    end;        
end;         

class Meteor_polygon<Component
    attr_accessor :poly
    def initialize(obj)
        super(obj)
        @poly=[]
        @poly<<{:x=>17, :y=>2}
        @poly<<{x:74, y:2}
        @poly<<{x:99, y:39}
        @poly<<{x:82, y:74}
        @poly<<{x:62, y:70}
        @poly<<{x:29, y:81}
        @poly<<{x:2, y:51}
        @poly<<@poly.first.clone;
        @poly=@poly.map{|p| {:x=>p[:x]+@object.x-@object.xCenter, :y=>p[:y]+@object.y-@object.yCenter}}
    end;

    def update

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
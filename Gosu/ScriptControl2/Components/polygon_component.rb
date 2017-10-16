require './Components/component.rb'
class PolygonComponent<Component
    attr_accessor :poly
    def initialize(obj)
        super(obj)
        @poly0=@object.poly
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
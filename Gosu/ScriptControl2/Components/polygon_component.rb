require './Components/component.rb'
class PolygonComponent<Component
    attr_accessor :poly
    def initialize(obj)
        super(obj)
        @poly0=@object.poly
        @poly0<<@poly0.first.clone;   
        @poly=@poly0.clone  

        if @object.class==LaserBlue01
            @poly=@poly0.map{|p| {:x=>p[:x]+@object.x, :y=>p[:y]+@object.y}}
            #puts "Start: poly=#{@poly}"
        else    
            @poly=@poly0.map{|p| {:x=>p[:x]*SCALER+@object.x-@object.xCenter*SCALER, :y=>p[:y]*SCALER+@object.y-@object.yCenter*SCALER}}
        end;  

        if @object.class==Boss1
            #puts "Boss1 #{@poly}"
        end; 
        @object.poly=@poly;# ???
    end;

    def update
        ang=Math::PI*@object.angle.fdiv(180)
        xc,yc=@object.xCenter, @object.yCenter;
        
        @polyOld=@poly; #Нужно только для лазеров
        
        if @object.class==LaserBlue01
            #puts xc
            #puts (@poly0[0][:x]-xc)*Math.cos(ang)
            xc=yc=0
            @poly1=@poly0.map{|p| {:x=>(p[:x]-xc)*Math.cos(ang)-(p[:y]-yc)*Math.sin(ang), :y=>(p[:x]-xc)*Math.sin(ang)+(p[:y]-yc)*Math.cos(ang)}}
            @poly=@poly1.map{|p| {:x=>p[:x]+@object.x, :y=>p[:y]+@object.y}}
        #puts "#{@object} 1.Laser ploy recount: #{@poly}"
            @poly[0]=@polyOld[1]
            @poly[2]=@polyOld[1]
        #puts "#{@object} 2. Laser ploy recount: #{@poly}"
            # Laser polygon consists of three points, 1==3
        else #для всех не-лазеров    
            @poly1=@poly0.map{|p| {:x=>(p[:x]-xc)*SCALER*Math.cos(ang)-(p[:y]-yc)*SCALER*Math.sin(ang), :y=>(p[:x]-xc)*SCALER*Math.sin(ang)+(p[:y]-yc)*SCALER*Math.cos(ang)}}
            @poly=@poly1.map{|p| {:x=>p[:x]+@object.x, :y=>p[:y]+@object.y}}
        end;
        @object.poly=@poly
        # if @object.class==MeteorBrownBig1
        #     puts "Meteor #{@poly}"
        # end;
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
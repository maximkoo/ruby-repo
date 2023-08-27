WHITE=Gosu::Color.argb(0xff_ffffff)
RED=Gosu::Color.argb(0xff_ff0000)
class Bird  
  attr_accessor :master
  attr_accessor :x, :y, :v, :angle, :expired
  attr_accessor :xc, :yc
  
  def initialize(master,x,y,v,a)
    @master=master
    @x,@y,@v,@angle=x,y,v,a
    #
    @neighbours=[]
    @color=WHITE   
    @xc,@yc=@x,@y 
  end;
  
  def update    
    @x=@x+v*Math::cos(@angle.degrees_to_radians)
    @y=@y+v*Math::sin(@angle.degrees_to_radians)
    
    @x=0 if @x>$window_width
    @y=0 if @y>$window_height
    @x=$window_width if @x<0
    @y=$window_height if @y<0
    #
    @xc=@x+BIRD_LENGTH*0.5*Math::cos(@angle.degrees_to_radians)
    @yc=@y+BIRD_LENGTH*0.5*Math::sin(@angle.degrees_to_radians)
    #    
    @neighbours.clear
    @color=WHITE
    @master.objects.each do |obj|      
      if obj!=self
        #if distance(self, obj)<VISION
        if shortest_distance(self, obj)<VISION
           @color=RED    
           @neighbours<<obj            
        end
      end
    end
  end
  
  def distance(obj1, obj2)
    #Math::sqrt((obj1.x-obj2.x)*(obj1.x-obj2.x)+(obj1.y-obj2.y)*(obj1.y-obj2.y))
    Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
  end
  
  def shortest_distance(obj1, obj2)
    d1=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
    d2=Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y-$window_height)
    d3=Gosu::distance(obj1.x, obj1.y, obj2.x-$window_width, obj2.y)
    d4=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y-$window_height)
    d5=Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y+$window_height)
    d6=Gosu::distance(obj1.x, obj1.y, obj2.x+$window_width, obj2.y)
    d7=Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y+$window_height)
    #puts [d1,d2,d3,d4,d5,d6,d7].min    
    [d1,d2,d3,d4,d5,d6,d7].min    
  end
  
  def draw 
    x1=@x+BIRD_LENGTH*Math::cos(@angle.degrees_to_radians)
    y1=@y+BIRD_LENGTH*Math::sin(@angle.degrees_to_radians)
    
    x2=@x+BIRD_WIDTH*Math::cos((@angle+90).degrees_to_radians)
    y2=@y+BIRD_WIDTH*Math::sin((@angle+90).degrees_to_radians)
    
    x3=@x+BIRD_WIDTH*Math::cos((@angle-90).degrees_to_radians)
    y3=@y+BIRD_WIDTH*Math::sin((@angle-90).degrees_to_radians)   
    
    Gosu.draw_triangle(x1, y1, @color, x2, y2, @color, x3, y3, @color, z=0);
    @neighbours.each do |obj|
      Gosu::draw_line(self.xc, self.yc, @color, obj.xc, obj.yc, @color, 0)      
    end     
  end
end;
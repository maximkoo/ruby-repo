WHITE=Gosu::Color.argb(0xff_ffffff)
class Bird  
  attr_accessor :master, :x, :y, :v, :angle, :expired
  def initialize(master,x,y,v,a)
    @master=master
    @x,@y,@v,@angle=x,y,v,a
  end;
  
  def update   
    @x=@x+v*Math::cos(@angle.degrees_to_radians)
    @y=@y+v*Math::sin(@angle.degrees_to_radians)
    
    @x=0 if @x>$window_width
    @y=0 if @y>$window_height
    @x=$window_width if @x<0
    @y=$window_height if @y<0
  end
  
  def draw 
    x1=@x+BIRD_LENGTH*Math::cos(@angle.degrees_to_radians)
    y1=@y+BIRD_LENGTH*Math::sin(@angle.degrees_to_radians)
    
    x2=@x+BIRD_WIDTH*Math::cos((@angle+90).degrees_to_radians)
    y2=@y+BIRD_WIDTH*Math::sin((@angle+90).degrees_to_radians)
    
    x3=@x+BIRD_WIDTH*Math::cos((@angle-90).degrees_to_radians)
    y3=@y+BIRD_WIDTH*Math::sin((@angle-90).degrees_to_radians)
    
    Gosu.draw_triangle(x1, y1, WHITE, x2, y2, WHITE, x3, y3, WHITE, z=0);     
  end
end;
class Shell
  attr_accessor :speed, :x, :y, :angle, :moving
  def initialize()
    @x=440; @y=100; @speed=10; @angle=180+rand(40)-20; @img=Gosu::Image.new('./laserBlue01_50.png');
    #@x=500; @y=250; @speed=10; @angle=270+rand(50)-25;
    @moving=true;
  end
  
  def update    
    @x=@x+@speed*Math::sin(@angle*Math::PI.fdiv(180));
    @y=@y-@speed*Math::cos(@angle *Math::PI.fdiv(180));
  end
  
  def draw
    #Gosu.draw_quad(@x-5,@y-5,Gosu::Color::GREEN, @x+5,@y-5,Gosu::Color::GREEN, @x+5,@y+5,Gosu::Color::GREEN, @x-5,@y+5, Gosu::Color::GREEN,10)    
    @img.draw_rot(@x,@y,10,@angle) ;
  end
end
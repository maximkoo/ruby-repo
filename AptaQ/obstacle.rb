class Obstacle
  attr_accessor :master
  attr_accessor :x, :y  
  attr_accessor :color, :expired
  def initialize(master, x, y)
    @master=master
    @x,@y=x,y
    @color=Gosu::Color::GRAY
  end
  
  def update
    
  end
  
  def draw
    Gosu::draw_quad(@x-OBSTACLE_SIZE/2, @y-OBSTACLE_SIZE/2, @color,
                    @x+OBSTACLE_SIZE/2, @y-OBSTACLE_SIZE/2, @color,
                    @x-OBSTACLE_SIZE/2, @y+OBSTACLE_SIZE/2, @color,
                    @x+OBSTACLE_SIZE/2, @y+OBSTACLE_SIZE/2, @color,0)
  end
end
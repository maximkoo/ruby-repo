class Point
  attr_accessor :x, :y
  def initialize(x,y)
    @x,@y=x,y
  end
end

class Vector 
  attr_accessor :len, :angle
  def initialize(len, angle)
    @len,@angle=len,angle
  end
end
require './bird.rb'
require './obstacle.rb'
require './bird_vector.rb'
class ObjectPool
attr_accessor :objects, :vector
def initialize
  @objects=[]
  # (0..19).each do |i|
    # @objects<<Bird.new(self, rand(600),rand(600),1,rand(361))  
  # end
   objects<<Bird.new(self,20,100,1,90)
   objects<<Bird.new(self,40,100,1,90)
   #objects<<Bird.new(self,60,100,1,90)
  
  #objects<<Bird.new(self,100,330,1,0)
  #######
  # @objects<<Obstacle.new(self,100,100)
  #@objects<<Obstacle.new(self,300,100) 
  # @objects<<Obstacle.new(self,500,100)
  #@objects<<Obstacle.new(self,100,300)
  @objects<<Obstacle.new(self,300,300) 
  #@objects<<Obstacle.new(self,500,300)
  # @objects<<Obstacle.new(self,100,500)
  #@objects<<Obstacle.new(self,300,500) 
  # @objects<<Obstacle.new(self,500,500)
  @c=@objects.size
  #
  @vector=BirdVector.new
end

def update
  @objects.map!(&:update)
end

def draw
  @objects.each do |bird|
    bird.draw    
  end
end;

def steer_cw(a=1)
  @objects.each do |bird|
    bird.angle+=a    
  end
end

def steer_ccw(a=1)
  @objects.each do |bird|
    bird.angle-=a    
  end
end
end;
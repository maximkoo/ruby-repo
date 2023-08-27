require './bird.rb'
class ObjectPool
attr_accessor :objects
def initialize
  @objects=[]
  (0..19).each do |i|
    @objects<<Bird.new(self, rand(600),rand(600),1,rand(361))  
  end
  #@objects<<Bird.new(self,20,100,0,90)
  #@objects<<Bird.new(self,580,100,0,270) 
  @c=@objects.size
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
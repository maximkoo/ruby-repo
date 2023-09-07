require './bird.rb'
require './obstacle.rb'
require './bird_vector.rb'
class ObjectPool
attr_accessor :objects, :vector
attr_accessor :birds
def initialize
  @objects=[]
  (0..19).each do |i|
    @objects<<Bird.new(self, rand(600),rand(600),1,rand(361))  
  end
   #objects<<Bird.new(self,40,100,1,90)
   #objects<<Bird.new(self,20,100,1,100)
   #objects<<Bird.new(self,60,100,1,90)
  
  #objects<<Bird.new(self,100,330,1,0)
  #######
  # @objects<<Obstacle.new(self,100,100)
  @objects<<Obstacle.new(self,300,100) 
  # @objects<<Obstacle.new(self,500,100)
  #@objects<<Obstacle.new(self,100,300)
  @objects<<Obstacle.new(self,300,300) 
  #@objects<<Obstacle.new(self,500,300)
  # @objects<<Obstacle.new(self,100,500)
  @objects<<Obstacle.new(self,300,500) 
  # @objects<<Obstacle.new(self,500,500)
  @c=@objects.size
  #
  @vector=BirdVector.new
  #@birds=[]
  @birds=@objects.select{|obj| obj.class.name=='Bird'}
end

def createBird(x,y)
  b=Bird.new(self, x,y,1,rand(361))
  @objects<<b
  @birds<<b 
end

def ToggleObstacle(x,y)
  a=0
  @objects.select{|obj|obj.class.name=='Obstacle'}.each do |obj|
    if (x-obj.x).abs<=OBSTACLE_SIZE.fdiv(2) && (y-obj.y).abs<=OBSTACLE_SIZE.fdiv(2)
      @objects=@objects-[obj];
      a+=1      
    end
  end
  if a==0 
    b=Obstacle.new(self, x,y)
    @objects<<b  
  end;
end

def update
  #@objects.map!(&:update)
  #
  
  @birds.map(&:update110) #self-movement
  @birds.map(&:update120) #collect neighbours
  
  @birds.map(&:update130) #process obstacles
  @birds.map(&:update140) #calculate average velocity vector
  
  @birds.map(&:update160) #avoid collision
  @birds.map(&:update150) #steer towards average velocity
  
  @birds.map(&:update170) #steer towards the mid-point
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
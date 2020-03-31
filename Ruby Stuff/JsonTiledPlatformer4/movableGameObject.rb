require './ColliderCore.rb'
class Rectangle
	attr_accessor :x,:y,:w,:h
	def initialize(x,y,w,h)
		@x,@y=x,y
		@w,@h=w,h
	end;
	
	def x1
		@x;
	end;
	
	def x2
		@x+@w-1;
	end;
	
	def y1
		@y
	end;
	
	def y2
		@y+@h-1
	end;
end;

class MovableGameObject<Rectangle
	attr_accessor :x,:y,:xS,:yS, :prevX, :prevY
	def initialize(x,y)			
		@x,@y=x,y
		@prevX,@prevY=x,y
		@xS,@yS=0,0
	end;

	def move
		@prevX=@x;
    	@prevY=@y;
    	@x+=@xS;
    	@y+=@yS;
	end;
end;

class Player<MovableGameObject
end;

class Obstacle<MovableGameObject
end;	

class Ladder<MovableGameObject
end;	
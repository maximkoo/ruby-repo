class Rectangle#<MovableGameObject
	attr_accessor :x,:y,:w,:h, :rectangle_name, :rectangle_type
	def initialize(x,y,w,h)
		@x,@y=x,y
		@w,@h=w,h
	end;
	
	def x1
		@x;
	end;
	
	def x2
		@x+@w;
	end;
	
	def y1
		@y
	end;
	
	def y2
		@y+@h
	end;
end;

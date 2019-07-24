class Rectangle
	attr_accessor :x,:y,:w,:h,:c, :prevX, :prevY, :xS, :yS
	def initialize(x,y,w,h,c)
		@x,@y,@w,@h,@c=x,y,w,h,c
		@xS=6;
		@yS=6;
	end;

	def draw()
		Gosu.draw_rect(@x, @y, @w, @h, @c, 0);
	end;

	def move();
		@prevX=@x;
    	@prevY=@y;
    	@x+=@xS;
    	@y+=@yS;
	end;	

	def x1
		x;
	end;
	
	def x2
		x+w;
	end;
	
	def y1
		y
	end;
	
	def y2
		y+h
	end; 

end;	
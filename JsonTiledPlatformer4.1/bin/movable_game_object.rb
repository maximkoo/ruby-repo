require './bin/Rectangle.rb'
class MovableGameObject<Rectangle
	attr_accessor :x,:y,:xS,:yS,:prevX,:prevY
	def initialize(x,y)			
		@x,@y=x,y
		@prevX,@prevY=x,y
		@xS,@yS=0,0
		if block_given?
			yield self
		end;	
	end;

	def move
		@prevX=@x;
    	@prevY=@y;
    	@x+=@xS;
    	@y+=@yS;
	end;
end;
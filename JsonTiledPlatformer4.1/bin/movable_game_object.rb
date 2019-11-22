require './bin/Rectangle.rb'
class MovableGameObject<Rectangle
	attr_accessor :x,:y,:xS,:yS,:prevX,:prevY, :master,:objects, :type
	def initialize(master,x,y)			
		@x,@y=x,y
		@prevX,@prevY=x,y
		@xS,@yS=0,0

		master.objects<<self;
		@master=master;
		@objects=[]

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
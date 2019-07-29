require './bridge_real.rb'
require 'gosu'
class BridgeDemo<Gosu::Window
	def initialize
		 super(400, 400, false);
		 @r=MyRedSquare.new;
		 @g=MyGreenRect.new;
	end;

	def draw
		@r.drawRedSquare(100,100,20);
		@g.drawGreenRect(200,200,50,80);
	end;	
end;	

class MyColorShape
	def initialize
		puts self.class.name # просто так
	end;	
end;

class MyRedSquare<MyColorShape
	def drawRedSquare(x,y,w)
		RedSquare.new.draw(x,y,w,w);
	end;
end;	

class MyGreenRect<MyColorShape
	def drawGreenRect(x,y,w,h)
		GreenRect.new.draw(x,y,w,h);
	end;
end;	


$b=BridgeDemo.new;
$b.show;


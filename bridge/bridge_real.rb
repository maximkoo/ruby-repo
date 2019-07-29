module BridgeInterface
	def draw(x,y,w,h)

	end;
end;

class ColorShape
	include BridgeInterface
	def draw(x,y,w,h)

	end;
end;	

class RedSquare<ColorShape
include BridgeInterface
	def draw(x,y,w,h)
		Gosu.draw_rect(x,y,w,w,Gosu::Color::RED);
	end;
end;	

class GreenRect<ColorShape
include BridgeInterface
	def draw(x,y,w,h)
		Gosu.draw_rect(x,y,w,h,Gosu::Color::GREEN);
	end;
end;	
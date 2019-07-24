require './rectangle.rb'
class RectangleFactory
def generate
	clr=[Gosu::Color::YELLOW, Gosu::Color::GREEN, Gosu::Color::BLUE, Gosu::Color::WHITE, Gosu::Color::FUCHSIA, Gosu::Color::AQUA ]
	c=clr[rand(clr.size)];
	w=h=15+rand(10)
	r=Rectangle.new(0,0,w,h,c);
	r.xS=6+rand(5);
	r.yS=6+rand(5);
	return r;
end;
end;

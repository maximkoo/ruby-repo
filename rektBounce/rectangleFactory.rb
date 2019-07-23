require './rectangle.rb'
class RectFactory
def generate
	return Rectangle.new(0,0,20,20,Gosu::Color::YELLOW);
end;

require 'gosu'
class C1<Gosu::Window
  def initialize
    super 980,980, false
	
end;

	def draw
		Gosu.draw_quad(100, 100, Gosu::Color::GRAY, 200, 50, Gosu::Color::WHITE, 200,250, Gosu::Color::WHITE, 100, 200, Gosu::Color::GRAY, 0, :default);
	end;	

end;	

C1.new.show;
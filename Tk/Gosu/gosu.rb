require 'gosu'

class C1<Gosu::Window
	def initialize width=200, height=200, fullscreen=false
		super
		self.caption="OLOLO";
		@background = Gosu::Image.new(self, './ticket.jpg')
		@large_font = Gosu::Font.new(self, "Futura", 200 / 20)
	end;

	def button_down(id)
		close if id==Gosu::KbEscape;
	end;

	def update
		#puts "Testing fps for update"
	end;

	def draw
		@background.draw(0,0,0)
		draw_text(10, 10, "Player Choice", @large_font, 0xffffd700)
    draw_text(20, 100, "Computer Choice", @large_font, 0xffffd700)


	end;

	def draw_text(x, y, text, font, color)
  font.draw(text, x, y, 3, 1, 1, color)
end
end;	

C1.new.show
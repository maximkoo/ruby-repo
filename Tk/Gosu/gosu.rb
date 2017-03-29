require 'gosu'

class C1<Gosu::Window
	def initialize width=200, height=200, fullscreen=false
		super
		self.caption="OLOLO";
	end;

	def button_down(id)
		close if id==Gosu::KbEscape;
	end;

	def update
	end;

	def draw
	end;
end;	

C1.new.show
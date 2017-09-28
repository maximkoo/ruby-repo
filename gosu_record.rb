require 'gosu'

class GameWindow<Gosu::Window
  #FRAME_DELAY=100.fdiv(32);
  def initialize
    super(600,600,fullscreen=false)
   #  @img=Gosu.record(10,10) do
  	# 	Gosu.draw_line(20,20,Gosu::Color::WHITE, 80,80, Gosu::Color::WHITE,1);
  	# end
  	@s=Gosu::TextInput.new
  	self.text_input=@s
  end;

  def filter
  	puts @s.text;
  end;

  def button_down(id)
  	if id==Gosu::KbEscape  		
  		close;
  	else
  		#puts @s.text;
  		filter(@s.text)
  		@img=Gosu::Image.from_text(@s.text,30,{font: 'Comic Sans MS'});	
  	end;	
  end;	

  def filter(text_in)
  	text_in.upcase.gsub(/[^A-Z0-9]/, '')
  end;	

  def draw
  	#@img.draw(150,150,1)
  	if !@img.nil?
  		@img.draw(100,100,1)
  	end;	
  end;	
end;

g=GameWindow.new
g.show    
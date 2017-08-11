require 'gosu'

class C1<Gosu::Window
	def initialize width=400, height=400, fullscreen=false
		super
		self.caption="OLOLO";
		@rock_image = Gosu::Image.new( '1.png');
	end;	

	def draw 
		# if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
  #     			puts :left
  #   	end

  #   	if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
  #     			puts :right
  #   	end

    	if Gosu.button_down? Gosu::KB_LEFT and Gosu.button_down? Gosu::KB_UP
    		puts :OLOLO
    	end;	

    	if Gosu.button_down? Gosu::KB_RIGHT and Gosu.button_down? Gosu::KB_UP
    		puts :OLOLO
    	end;
    end;
end;	

C1.new.show		
require 'gosu'
class GameWindow<Gosu::Window
	SCREEN_WIDTH=400; #Gosu.screen_width;
	SCREEN_HEIGHT=400;#Gosu.screen_height;
	def initialize
		super(SCREEN_WIDTH,SCREEN_HEIGHT, false)
		@cells=[]
	end;

	def needs_cursor?
    	true
  	end

  	def button_down(id)
        if id==Gosu::MsLeft
      		#puts "Mouse Clicked at #{mouse_x} : #{mouse_y}"    
      		@cells<<Hash[x:mouse_x.to_i,y:mouse_y.to_i]
    	end;
    	if id==Gosu::KbEscape
    		#puts @cells
    		close;
    	end;	
    end;	 

    def draw
    	@cells.each do |c|
    		Gosu.draw_rect(c[:x],c[:y],10,10,Gosu::Color::RED, 10);
    	end
    end;	
end;
c1=GameWindow.new
c1.show;
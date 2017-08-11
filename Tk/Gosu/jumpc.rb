module JumpControl
def button_down(id)
		close if id==Gosu::KbEscape;

		close if id==Gosu::KbEscape;
		if id==Gosu::KbUp
			puts :up
			@y-=10
		end	
		if id==Gosu::KbDown
			puts :down
			@y+=10
		end	
		if id==Gosu::KbLeft
			puts :left
			@x-=10
		end	
		if id==Gosu::KbRight
			puts :right
			@x+=10
		end	

		if id==Gosu::KbSpace
			puts :Space		
			@jumping=true;
			@vy=2
			#@vx=1
			@t=0
			#jump
		end;	
	end;
end;	

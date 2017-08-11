require 'gosu'

class C1<Gosu::Window
	def initialize width=400, height=400, fullscreen=false
		super
		self.caption="OLOLO";
		@rock_image = Gosu::Image.new(self, '1.png')
		@x=100
		@y=100
		@vy=10
	end;

	def button_down(id)
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
			@yi=@y
			
			jump
		end;	
	end;

	def update
		#puts "Testing fps for update"
	end;

	def draw
		@rock_image.draw(@x, @y, 0)
		#@x+=@v
	end;

	def jump
		#while @y<=@yi do
		@t=0
		5.times do
			puts "#{@t}."
			@y=@y-@vy+(9*@t*@t).fdiv(2)
			@t+=1
			puts @y
			sleep(0.3)
			
			puts (9*@t*@t).fdiv(2)
		end;
	end;	

end;	

C1.new.show
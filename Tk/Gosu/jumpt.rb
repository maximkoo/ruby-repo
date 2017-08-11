require 'gosu'
require './jumpc.rb'

class C1<Gosu::Window
	include JumpControl
	def initialize width=400, height=400, fullscreen=false
		super
		self.caption="OLOLO";
		@rock_image = Gosu::Image.new( '1.png')
		@x=100
		@y=@ystart=100
		@vx=0
		@vy=0
		@t=0
		@jumping=false
		@timestep=1.fdiv(60)
	end;

	def update
		#puts "Testing fps for update"
	end;

	def draw
		if @jumping
			# puts @y
			# puts @vy
			# puts @t
			#@y=[@y-@vy,@ystart].min
			if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      			@vx=-1
    		end
    		if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      			@vx=1
    		end

			@y-=@vy
			if @y>@ystart# && @vx>0
				@y=@ystart
				@vx=0
				@jumping=false
			#else
				
			end;	
			@x=@x+@vx
			@t+=@timestep
			@vy-=9.81*@t*@t*0.5
		end;
		@rock_image.draw(@x, @y, 0)
	end;

end;	

C1.new.show
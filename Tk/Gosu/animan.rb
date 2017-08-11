require 'gosu'
class C1 < Gosu::Window
	def initialize
		super 640, 480
		self.caption = "Tutorial Game"
		#@star_anim = Gosu::Image.load_tiles("running-man-animation3.jpg ", 1300/14, 268)
		@star_anim = Gosu::Image.load_tiles("walk-cycle-poses.jpg ",560/4, 257)
		@background = Gosu::Image.new('./white.png', :tileable=>true)
		@t=0
		@x=0
	end;

	def draw		
		@background.draw(0,0,0)

		img = @star_anim[Gosu.milliseconds / 120 % @star_anim.size]
		#img.draw((self.width/14)*(Gosu.milliseconds / 100 % @star_anim.size),50,1)
		# @img=@star_anim[@t]
		 img.draw(@x,20,1)
		 @x+=3
		 @x=@x % self.width
		# @t+=1
		# @t=0 if @t>=@star_anim.size
	end;	
end;

C1.new.show
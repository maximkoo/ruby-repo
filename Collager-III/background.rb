require 'mini_magick'
class BackGround
	#def initialize(x,y, brdX, brdY, brdSize)
	def initialize(x, y)
		@brdSize=10
		x=MiniMagick::Tool::Convert.new do |i|
	 		i.size "#{x}x#{y}"
	 		i.gravity "center"
	 		i.xc "white"
	 		i.compose "Over"
	 		i << "test_image.jpg"
		end;
		@b=MiniMagick::Image.open("test_image.jpg")
	end;	

	def getBackGround
		@b
	end;	
end;	
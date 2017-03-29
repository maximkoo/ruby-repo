require 'mini_magick'

class Collager
	def initialize (*args)
		x=MiniMagick::Tool::Convert.new do |i|
 			i.size "100x100"
 			i.gravity "center"
 			i.xc "white"
 			i.compose "Over"
 			i.caption "X"
 			i << "test_image.jpg"
		end

		@tst=MiniMagick::Image.open("test_image.jpg")	
	end;
	
	def getOut
		File.delete("test_image.jpg")
		return @tst;
	end;	
end;

i=Collager.new(ARGV);
i.getOut.write "out.jpg"
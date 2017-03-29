require 'mini_magick'

class Collager
	def initialize(f1, f2)
   		img1=MiniMagick::Image.open(f1)
	   	img2=MiniMagick::Image.open(f2)
	   	x1=img1.width
	   	y1=img1.height
	   	x2=img2.width
	   	y2=img2.height
	   	puts "Original width1=#{x1}"
	   	puts "Original height1=#{y1}"
	   	puts "Original width2=#{x2}"
	   	puts "Original height2=#{y2}"
	   	type=""
	   	if x1>y1 and x2>y2
			type= "Horizontal" 
	   	elsif y1>=x1 and y2>=x2  
	   		type="Vertical"
	   	end;		
	   	puts type 	
	   	self.collage(img1, img2, type)
 	end

 	def collage(img1, img2, type)
 		#collage = MiniMagick::Image.create "jpg", false do |c|
    #c.size "1024x768"
    #c.canvas "white"
#end

bigX=img1.width+img2.width;
bigY=img1.height

x=MiniMagick::Tool::Convert.new do |i|
 i.size "#{bigX}x#{bigY}"
 i.gravity "center"
 i.xc "white"
 i.compose "Over"
 i << "test_image.jpg"
end

tst=MiniMagick::Image.open("test_image.jpg")
tst = tst.composite(img1) do |c|
  		c.compose "Over"    # OverCompositeOp
  		#c.geometry "+0+0" # copy second_image onto first_image from (20, 20)
  		c.gravity "west"
		end
tst = tst.composite(img2) do |c|
  		c.compose "Over"    # OverCompositeOp
  		#c.geometry "+0+0" # copy second_image onto first_image from (20, 20)
  		c.gravity "east"
		end


 		#offset=img1.width
		#result = img1.composite(img2) do |c|
  		#	c.compose "Over"    # OverCompositeOp
  		#	c.geometry "300x300+50+0" # copy second_image onto first_image from (20, 20)
		#end
		#img1.resize "300x300"
		
		tst.write "output.jpg"


 	end;
end;

i=Collager.new(ARGV[0], ARGV[1])	
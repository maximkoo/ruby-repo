require 'mini_magick'

class Meme<MiniMagick::Image

	#def initialize(imgfile, txtfile)
	def initialize(*args)
		imgfile, txtfile=ARGV
		#puts imgfile
		#txtfile=ARGV[1]
		#puts txtfile
		@pointsize=40;
		#@pic=MiniMagick::Image.new(imgfile);
		#@pic=super(File.open(imgfile));
		#@pic=MiniMagick::Image.open(imgfile);
		@pic=MiniMagick::Image.new(imgfile);
		puts @pic.inspect;
		lines=[]
		File.open(txtfile, "r:UTF-8").each_line {|x| lines<<x}
		@pic.combine_options do |c|		
		 	c.encoding "UTF-8"
		 	c.font "impact.ttf"	 
		 	c.pointsize ("#{@pointsize}")
		 	c.gravity("North")
	  		c.draw("text 0,0 #{lines[0]}")
		 	c.stroke("#000000")
		 	c.strokewidth("1.5")
		 	c.fill("#FFFFFF")		 	 	
		end

		if lines[1] then
			@pic.combine_options do |c|
				c.encoding "UTF-8"
		 		c.font "impact.ttf"	 
		 		c.pointsize ("#{@pointsize}") 
				c.gravity("South")
				c.draw("text 0,0 #{lines[1]}")
				c.stroke("#000000")
		 		c.strokewidth("1.5")
		 		c.fill("#FFFFFF")
			end		 
		end	
	end;
end;		


m=Meme.new(ARGV[0])#.generate;


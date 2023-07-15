require 'mini_magick'

class Meme<MiniMagick::Image

	def initialize(imgfile)
		@pointsize=40;
		#@pic=MiniMagick::Image.new(imgfile);
		#@pic=super(File.open(imgfile));
		#@pic=MiniMagick::Image.open(imgfile);
		@pic=MiniMagick::Image.new(imgfile);
		puts @pic.inspect;
		@pic.combine_options do |c|
		#self.combine_options do |c|
		 	c.encoding "UTF-8"
		 	c.font "impact.ttf"	 
		 	c.pointsize ("#{@pointsize}")
		 	c.gravity("North")
	  		c.draw("text 0,0 'TROLOL OLOLO'")
		 	c.stroke("#000000")
		 	c.strokewidth("1.5")
		 	c.fill("#FFFFFF")
		end
	end;
end;		


m=Meme.new(ARGV[0])#.generate;


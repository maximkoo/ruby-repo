require 'mini_magick'

class Meme<MiniMagick::Image

	def initialize(imgfile)
		@pointsize=40;
		@pic=MiniMagick::Image.new(imgfile);
		@pic.write(File.basename(imgfile,'.*')+"_meme"+File.extname(imgfile));	
		@pic=super(File.basename(imgfile,'.*')+"_meme"+File.extname(imgfile));
	end;

	def addText(text)
		self.combine_options do |c|                                                                                  
		 c.encoding "UTF-8"
		 c.font "impact.ttf"	 
		 c.pointsize ("#{@pointsize}")                                                                                            
		 yield c, text
		 c.stroke("#000000")
		 c.strokewidth("1.5")
		 c.fill("#FFFFFF")                                                                                            
		end
	end;

	def generate
	  lines=[]
	  File.open("text.txt", "r:UTF-8").each_line {|x| lines<<x}
      ##lines = File.readlines("text.txt") #--<<--Нельзя просто так взять и явно указать кодировку((щито поделать
	  puts lines
	  
	  self.addText(text) do |c, x|
	  c.gravity("North")
	  c.draw("text 0,0 '#{lines[0]}'")
	  end;
	  if lines[1] then
		  self.addText(text) do |c, x|
		  c.gravity("South")
		  c.draw("text 0,0 '#{lines[1]}'")
		  end;
	  end
	end;
end;

m=Meme.new(ARGV[0]).generate;


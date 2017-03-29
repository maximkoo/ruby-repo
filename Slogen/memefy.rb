require 'mini_magick'

class Meme<MiniMagick::Image

	def initialize(imgfile, imgText1, imgText2)
		@pointsize=40;
		@pic=MiniMagick::Image.new(imgfile);
		timeStamp=Time.now.strftime("%Y%m%d_%H%M%S");
		@pic.write(File.basename(imgfile,'.*')+"_meme_"+timeStamp+File.extname(imgfile));	
		@pic=super(File.basename(imgfile,'.*')+"_meme_"+timeStamp+File.extname(imgfile));
		@imgText1=imgText1
		@imgText2=imgText2
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
	  #File.open("text.txt", "r:UTF-8").each_line {|x| lines<<x}
      ##lines = File.readlines("text.txt") #--<<--Нельзя просто так взять и явно указать кодировку((щито поделать
	  lines=[@imgText1, @imgText2]
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

#m=Meme.new(ARGV[0]).generate;


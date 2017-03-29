require "mini_magick"

class Background<MiniMagick::Image
	 def initialize(f)
	  @black=MiniMagick::Image.new(f)
	  @black.write("bg.jpg");
	  @b=super("bg.jpg")
	 end
 
	 def getBackground(*args)
	 #puts args[0]
	 #puts args[1]
	  self.resize "#{args.max}x#{args.max}" #получается квадрат
	  self.crop "#{args[0]}x#{args[1]}+0+0" #Обрезаем по размерам
	 end;
 
	def drawFrame(offset, lowspace, thickness)
	puts "***"
	@dims=self.dimensions;
	@upper_left="#{offset},#{offset}"
	@lower_right="#{@dims[0]-offset},#{@dims[1]-offset-lowspace}"
	self.combine_options do |m|
		m.fill "white"
		m.draw "rectangle #{@upper_left},#{@lower_right}"
	end;
	@upper_left="#{offset+thickness},#{offset+thickness}"
	@lower_right="#{@dims[0]-offset-thickness},#{@dims[1]-offset-lowspace-thickness}"
	self.combine_options do |m|
		m.fill "black"
		m.draw "rectangle #{@upper_left},#{@lower_right}"
	end;
	end;	
	
	def addText(*text)
	@text="#{text[0]}\n#{text[1]}"
	self.combine_options do |c|                                                                                  
     c.gravity 'South' 
     c.font "times.ttf"	 
     c.pointsize '60'                                                                                             
     c.draw ("text 0,-10 '#{text[0]}'") 
	 c.pointsize '30'
     c.draw ("text 0,25 '#{text[1]}'") if text[1]   	 
     c.fill("#FFFFFF")                                                                                            
    end

	end;
end;

class UserImage<MiniMagick::Image
 def initialize(f)
  @black=MiniMagick::Image.new(f)
  @black.write("pic#{File.extname(f)}");
  @b=super("pic#{File.extname(f)}")
 end
 
 def resize_to(maxSize)
  @out=[]
  @dims=self.dimensions
  puts @dims;
  if @dims[0]<maxSize then @out="#{@dims[0]}x#{@dims[1]}"
  else
    if @dims[0]>=@dims[1] then
		@out="#{maxSize}x#{@dims[1]*maxSize.fdiv(@dims[0])}"
	else
        @out="#{@dims[0]*maxSize.fdiv(@dims[1])}x#{maxSize}"
    end	
  end;
  puts @out
  self.resize "#{@out}"
 end;
end;

class Demotivator
 def initialize
  @maxSize=600
  @outer_offset=25
  @inner_offset=25
  @offset=@outer_offset+@inner_offset
  @lowspace=100
  @thickness=2
  lines=[]
  
  File.open("lines.txt", "r:UTF-8").each_line do |x|
   lines<<x
  end;
  puts lines;  
  
  second=UserImage.new(ARGV[0]).resize_to(@maxSize);
  dims=second.dimensions;
  
  first=Background.new("black.jpg").getBackground(dims[0]+@offset+@offset,dims[1]+@offset+@offset+@lowspace);
  first.drawFrame(@outer_offset,@lowspace,@thickness)
  first.addText("#{lines[0]}","#{lines[1]}")
  
      @result = first.composite(second) do |c|
	  c.compose "Over"    # OverCompositeOp
	  c.geometry "+#{@offset}+#{@offset}"
	  end;	
	puts "Composed"
	
	@result.write("demo.jpg")
	File.delete("bg.jpg")
	File.delete("pic#{File.extname(ARGV[0])}")
 end;
end;

c=Demotivator.new




 
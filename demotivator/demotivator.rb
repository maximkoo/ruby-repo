require 'mini_magick'
class Background < MiniMagick::Image
  def initialize
    #file=File.open("black.jpg","r");
	@black=MiniMagick::Image.new("black.jpg")
	@black.write("demo.jpg");
	@bg=MiniMagick::Image.new("demo.jpg")
	@bg.resize "600x800"
	
	t="На Ruby можно\nделать демотиваторы"
	@bg.combine_options do |c|                                                                                  
     c.gravity 'South'                                                                                        
     #c.font "c:/Program Files/DVD Maker/Eurosti.ttf"   
     c.font "times.ttf"	 
     c.pointsize '40'                                                                                             
     c.draw ("text 0,50 '#{t}'")                                                    
     c.fill("#FFFFFF")                                                                                            
    end
	
	@bg.combine_options do |m|
          m.fill 'white'
		  m.draw 'line 50,50,550,50'
		  m.draw 'line 550,50,550,450'
		  m.draw 'line 50,50,50,450'
		  m.draw 'line 50,450,550,450'
        end
		
	second_image = MiniMagick::Image.new("IMG_20160208_143133.jpg");
	second_image.write "img.jpg"
	@img = MiniMagick::Image.new("img.jpg");
	@img.resize "450x450"
	
	@result = @bg.composite(@img) do |c|
	  c.compose "Over"    # OverCompositeOp
	  c.geometry "+75+75" # copy second_image onto first_image from (20, 20)
	end	
	@bg
  end;
  
  def writeIt(fname)
    #@bg.write("#{fname}");
	@result.write("#{fname}");
  end;
end;

 class Demo
  @bg 
  def initialize
    @bg=Background.new;
	@pic=@bg
  end; 
  
  def processPic
   
   
  end;
  
  def write
    @pic=@bg
    @pic.writeIt "demo.jpg";
  end;
end;  

d=Demo.new;
#d.processPic;
d.write;

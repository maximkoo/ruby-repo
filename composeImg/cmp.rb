require 'mini_magick'

first_image  = MiniMagick::Image.new("red.jpg")
second_image = MiniMagick::Image.new("yellow.jpg")
result = first_image.composite(second_image) do |c|
  c.compose "Over"    # OverCompositeOp
  c.geometry "+20+20" # copy second_image onto first_image from (20, 20)
end
t="DianaDesign"+"\n"+"DesignDiana" ##--<<--две строчки текста!!                     

result.combine_options do |c|                                                                                  
     c.gravity 'South'                                                                                        
     c.font "c:/Program Files/DVD Maker/Eurosti.ttf"                                                      
     c.pointsize '20'                                                                                             
     c.draw ("text 10,0 '#{t}'")  ##--<<--две строчки текста!!                                                                          
     c.fill("#00FF00")                                                                                            
end 
#first_image.write("1.jpg");

result.combine_options do |m|
          #m.alpha 'transparent'
          #m.background 'none'
          m.fill 'white'
          #m.draw 'roundrectangle 1,1,100,100,20,20'
		  #m.draw 'line 1,1,100,100'
		  m.draw 'rectangle 20,20,100,100'
        end
result.write "output.jpg"



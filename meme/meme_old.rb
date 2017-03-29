# -*- encoding: utf-8 -*-
require 'mini_magick'

text=["Нельзя просто так взять","и сделать русские буквы"]
pointsize=40;

pic=MiniMagick::Image.new("Nelzya-prosto-tak-vzyat-i_orig_(1).jpg");
pic.write("meme.jpg")	
pic=MiniMagick::Image.new("meme.jpg");
#Encoding.list.each { |xx| p xx.name}
pic.combine_options do |c|                                                                                  
     c.gravity 'North' 
	 c.encoding "UTF-8"
     c.font "impact.ttf"	 
     c.pointsize ("#{pointsize}")                                                                                            
     c.draw ("text 0,0 '#{text[0]}'") 
     c.stroke("#000000")
	 c.strokewidth("1.5")
     c.fill("#FFFFFF")                                                                                            
    end

pic.combine_options do |c|                                                                                  
     c.gravity 'South' 
	 c.encoding "UTF-8"
     c.font "impact.ttf"	 
     c.pointsize ("#{pointsize}")                                                                                             
     c.draw ("text 0,0 '#{text[1]}'") 
     c.stroke("#000000")
	 c.strokewidth("1.5")
     c.fill("#FFFFFF")                                                                                            
    end

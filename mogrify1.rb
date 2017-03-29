require 'mini_magick'
# x1=MiniMagick::Tool::Mogrify.new do |i|
# 	 	#i.size "100x100"
# 	 	#i.gravity "center"
# 	 	#i.xc "black"
# 	 	#i.compose "Over"
# 	 	i << "qq.jpg"
# end;	
File.delete("qqq.jpg") if File.exists?("qqq.jpg");
x2=MiniMagick::Tool::Convert.new do |i|
	 	#i.resize "100x100"
	 	#i.gravity "center"
	 	i.xc "black"
	 	#i.compose "Over"
	 	i << "qqq.jpg"
end;

a=MiniMagick::Image.open("qqq.jpg");
a.resize "200x200";
a.write("qqq.jpg");

# b=MiniMagick::Image.open("qqq.jpg")
# b.resize "400x200>"
# b.write("qqq.jpg");

# MiniMagick::Image.new("qqq.jpg") do |i|
# i.resize("400x400")
# i.write("qqq.jpg")
# end;	

b=MiniMagick::Tool::Convert.new;
b<<"qqq.jpg" #входящий файл
b.resize("400x400")
b<<"qqq1.jpg" #исходящий файл
b.call

b=MiniMagick::Tool::Mogrify.new;
#b<<"qqq.jpg"
b.resize("500x500")
b<<"qqq.jpg"
b.call

#http://www.imagemagick.org/script/command-line-options.php#duplicate

с=MiniMagick::Tool::Convert.new;
с<<"qqq.jpg"
с.extent("600x500")
с<<"qqq.jpg"
с.call

#Новое изображение - красный квадратик
redSquare=MiniMagick::Tool::Convert.new do |i|
	i.resize "100x100"
	i.xc "red"
	i.background "black" # на черном фоне
	i.rotate "-45" # то есть красный квадратик повернется, и в углах будет виден черный фон
	i << "redSquare.jpg"
end;

#Наложение картинок
bkg=MiniMagick::Image.open "qqq.jpg" 
#Любопытно, что если использовать переменную a, которая вроде бы содержит этот же файл, 
# то будет использован файл в том виде, в каком он был на момент a.write, без последующий преобразований
# т.е. в размере 200х200
redSquareImg=MiniMagick::Image.open "redSquare.jpg"
bkg=bkg.composite(redSquareImg) do |c|
	 c.compose "Over"    # OverCompositeOp
	 c.geometry "+50+50" # copy second_image onto first_image from (50, 50)
	end;
bkg.write("qqq.jpg")	

bbb=MiniMagick::Tool::Mogrify.new do |i|
	#i.annotate +5+5 'OLOLO'
	i.fill "white"
	i.pointsize ("20") 
	i.gravity "north" #обязательно!
	i.draw('text 0,100 "OLOLO"')
	i<<"qqq.jpg"
	i.call
end;	

File.delete("redSquare.jpg") if File.exists?("redSquare.jpg");


require 'tk'
require 'mini_magick'
class Fifteen
	def initialize
		@root = TkRoot.new {title "Hello Tk!"; padx 1; pady 1}
		@cnv1=TkCanvas.new(@root){background 'gray'}.grid :sticky => 'nws', :column => 0, :row => 0
		#@img=MiniMagick::Image.open("1.jpg");
		@brdSize=2
		TkButton.new(@root, :text=>"Shuffle!",:command=>proc{shuffle}).grid :sticky => 'e', :column => 1, :row => 0
	end;

	def crash
		totalX=totalY=500
		pieces=4
		xx=totalX.fdiv(pieces)
		yy=totalY.fdiv(pieces)
		@imgs=[]
		(1..pieces).each do |i|
			(1..pieces).each do |j|
				@img=MiniMagick::Image.open("1.jpg");
				geo="#{xx}x#{yy}+#{(j-1)*yy}+#{(i-1)*xx}"
				h=Hash.new
				img=@img.crop (geo);
				img=img.format "gif"
				h["image"]=img
				h["row"]=i;
				h["pos"]=j;
				h["xx"]=xx
				h["yy"]=yy
				h["filename"]="./res/#{i}#{j}.gif";
				@imgs.push(h);
				@imgs.last["image"].write(h["filename"]);
			end;	
		end;
		@cnv1['width']=1600
		@cnv1['height']=1600;	
		@imgs.pop
	end;

	def load
		totalX=totalY=500
		pieces=4
		xx=totalX.fdiv(pieces)
		yy=totalY.fdiv(pieces)
		@imgs=[]
		(1..pieces).each do |i|
			(1..pieces).each do |j|
				h=Hash.new				
				h["row"]=i;
				h["pos"]=j;
				h["xx"]=xx
				h["yy"]=yy
				#h["filename"]="./res/#{i}#{j}.gif";
				h["filename"]="c:/Users/Maxim/Documents/Ruby/Tk/Forms/IMG_4150/#{i}#{j}.gif";
				begin
					#puts h["filename"]
					img=MiniMagick::Image.open(h["filename"]);
					h["image"]=img
				rescue Errno::ENOENT #RuntimeError #IOError #Errno::ENOENT
					puts "OLOLOLO"
					h["filename"]="NO.gif"
					h["image"]=MiniMagick::Image.open("NO.gif");
				end;	
				
				@imgs.push(h);
			end;	
		end;
		@voidCell=@imgs.pop
		@cnv1['width']=600
		@cnv1['height']=600;
		#puts @voidCell.to_s	
	end;	

	def lay
		#puts @imgs.to_s
		@imgs.each do |img|
			puts img["filename"]
			img["phi"]=TkPhotoImage.new(:file => img["filename"]);
			puts "#{img['pos']} #{img['row']}"
			puts "#{img['xx']} #{img['yy']}"
			xPos=@brdSize*img["pos"]+125*(img["pos"]-1)+img["xx"]*0.5
			yPos=@brdSize*img["row"]+125*(img["row"]-1)+img["yy"]*0.5
			print "xPos=#{xPos}; yPos=#{yPos}; "
			puts 
			img["tkc"]=TkcImage.new(@cnv1, xPos, yPos){image img["phi"]}
			img["tkc"].bind("1",proc{swapToEmpty(img)})
		end;	
	end;

	def swapToEmpty(img)
		puts "Void is near?"+voidIsNear?(img["row"],img["pos"]).to_s
		puts "Where?"+whereIsVoid?(img["row"],img["pos"]).to_s

		#puts "ACTUAL VOID: #{@voidCell["row"]} #{@voidCell["pos"]}"
		#puts "ACTUAL IMG: #{img["row"]} #{img["pos"]}"
		voidIsNear?(img["row"],img["pos"]) or return
		
		mv=whereIsVoid?(img["row"],img["pos"])

		vstep=1
		(1..img["xx"]+@brdSize).step(vstep) do 
			img["tkc"].move(mv.first*vstep, mv.last*vstep)
			@root.update
			#sleep(0.01)
		end;	
		puts "VOID: #{@voidCell["row"]} #{@voidCell["pos"]}"
		puts "IMG: #{img["row"]} #{img["pos"]}"
		@voidCell["pos"], img["pos"]=img["pos"], @voidCell["pos"]
		@voidCell["row"], img["row"]=img["row"], @voidCell["row"]
		puts "VOID: #{@voidCell["row"]} #{@voidCell["pos"]}"
		puts "IMG: #{img["row"]} #{img["pos"]}"
	end;

	def voidIsNear?(row, pos)
		return [[row+1,pos],[row-1,pos],[row,pos+1],[row,pos-1]].include?([@voidCell["row"],@voidCell["pos"]])
	end;

	def whereIsVoid?(row,pos)
		case [[row+1,pos],[row-1,pos],[row,pos+1],[row,pos-1]].index([@voidCell["row"],@voidCell["pos"]])
		when 0 then [0,1]
		when 1 then [0,-1]
		when 2 then [1,0]
		when 3 then [-1,0]	
		end;
	end;	

	def shuffle
		#xr=1+rand(4);
		#yr=1+rand(4);
		20.times do
			a=@imgs.select{|x| voidIsNear?(x["row"],x["pos"]) }
			aa=rand(a.size)
			mv=whereIsVoid?(a[aa]["row"],a[aa]["pos"])
			swapToEmpty(a[aa])
		end
	end;	
end;

x=Fifteen.new
#x.crash
x.load
x.lay
Tk.mainloop

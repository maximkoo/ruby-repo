require 'mini_magick'

class Collager
	def initialize(args)
		return if args.size==1;
		horis=[]
		verts=[]
		imgs=[]
		modif=""
		args.each do |i|
			imgs.push(MiniMagick::Image.open(i))
			if imgs.last.width>imgs.last.height
				#type= "Horizontal" 
				puts ("Horizontal")
				horis.push(imgs.last);
		   	else  
		   		#type="Vertical"
		   		puts ("Vertical")
		   		verts.push(imgs.last)
		   	end;
		end;
		puts "Total HORZ=#{horis.size}"
		puts "Total VERT=#{verts.size}"

		ddd=case (horis.size*10+verts.size)
			when 2 then ManyVert.new{|t| t.brdX=1; t.brdY=0}
			when 3 then ManyVert.new{|t| t.brdX=2; t.brdY=0}
			when 4 then ManyVert.new{|t| t.brdX=3; t.brdY=0};

			when 20 then ManyVert.new{|t| t.brdX=1; t.brdY=0}
			when 30 then nil; #Makes no sense
			when 40 then Square.new{|t| t.brdX=1; t.brdY=1};

			when 11 then Forel.new;	
			when 12 then Twindow.new;
			when 13 then TTwindow.new;
			when 21 then SideWindow.new{|t| t.brdX=1; t.brdY=1};
			when 22 then HakenKreuz.new;
			when 31 then SmallSide.new;
				
			end;
		res=ddd.makeCollage(horis, verts, modif); 	
		WriterJPG.new(res)
	end;	
end;

class BackGround
	def initialize(x,y, brdX, brdY, brdSize)
		@brdSize=brdSize
		x=MiniMagick::Tool::Convert.new do |i|
	 	i.size "#{x+@brdSize*brdX}x#{y+@brdSize*brdY}"
	 	i.gravity "center"
	 	i.xc "white"
	 	i.compose "Over"
	 	i << "test_image.jpg"
		end;
	end;	
end;	

class WriterJPG
	def initialize(t)
		t.write "collage_"+Time.now.strftime("%Y%m%d_%H%M%S")+".jpg"
		puts "Successfully saved"
	end;
end;	

class ManyVert

	attr_accessor :brdX, :brdY

	def initialize
		yield(self) if block_given?
		@brdSize=10;
		@totalX=800-@brdSize*@brdX;		
	end;
	
	def makeCollage(h, v, m)
		if v.empty?
			v=h;
		end;	
		xx=v.map{|e| e.width}
		yy=v.map{|e| e.height}

		#ratio=@totalX.fdiv(xx[0]+xx[1]+xx[2])
		ratio=@totalX.fdiv(xx.reduce(:+))
		ratio=1 if ratio>1

		newXX=xx.map{|e| e*ratio}
		newYY=yy.map{|e| e*ratio}

		newX=newXX.inject(:+);
		newY=newYY.max;

		bkg=BackGround.new(newX,newY, @brdX,@brdY,@brdSize)
		offset=0
		tst=MiniMagick::Image.open("test_image.jpg")
		(0..v.size-1).each do |i|
			img = v[i].resize("#{newXX[i]}x#{newYY[i]}")
			tst = tst.composite(img) do |c|
	  			c.compose "Over"    # OverCompositeOp
	  			c.geometry "+#{offset}+0" # copy second_image onto first_image from (20, 20)
	  			offset+=img.width+@brdSize;
			end;	
		end;
		#WriterJPG.new(tst);
		tst
	end;
end;			

class Forel
	def initialize
		@brdSize=10;
		@brdX=1; 
		@brdY=0;
		@totalX=800-@brdSize*@brdX;
	end;	

	def makeCollage(h, v, m)
		x1=v.first.width;		y1=v.first.height;
		x2=h.first.width;		y2=h.first.height;

		#puts x1
		#puts x2

		#a=800*(1.fdiv(x1)+y2.fdiv(y1*x2))
		#b=800*(y1.fdiv(x1*y2)+1.fdiv(x2))

		b=@totalX.fdiv(x1*y2.fdiv(y1)+x2)
		a=b*y2.fdiv(y1)

		b=1 if b>1
		a=1 if a>1

		puts a.to_f
		puts b.to_f	

		newX1=x1*a;		newY1=y1*a
		newX2=x2*b;		newY2=y2*b

		newX=newX1+newX2
		newY=newY1
		bkg=BackGround.new(newX,newY, @brdX,@brdY,@brdSize)
		
		tst=MiniMagick::Image.open("test_image.jpg")
		img = v.first.resize("#{newX1}x#{newY1}")
		tst = tst.composite(img) do |c|
	  		c.compose "Over"    # OverCompositeOp
	  		#c.geometry "+0+0" # copy second_image onto first_image from (20, 20)
	  		c.gravity "west"
		end
		img = h.first.resize("#{newX2}x#{newY2}")
		tst = tst.composite(img) do |c|
	  		c.compose "Over"    # OverCompositeOp
	  		#c.geometry "+0+0" # copy second_image onto first_image from (20, 20)
	  		c.gravity "east"
		end

		#WriterJPG.new(tst)
		tst
	end;
end;	


class Square

	attr_accessor :brdX, :brdY

	def initialize
		yield(self) if block_given?
		@brdSize=10;
		@totalX=800-@brdSize*@brdX;
	end;

	def makeCollage(h, v, m)
		puts "Collage type: SQUARE"
		tsts=[]
		tsts.push(ManyVert.new{|t| t.brdX=1; t.brdY=0}.makeCollage(h.take(2), [], ""))
		tsts.push(ManyVert.new{|t| t.brdX=1; t.brdY=0}.makeCollage(h.last(2), [], ""))
		#puts "TST1.height #{tst1.height}"

		newX=tsts.first.width;
		#newY=tsts.reduce{|sum, w| sum+w.height}
		newY=tsts.first.height+tsts.last.height;

		bkg=BackGround.new(newX,newY, @brdX,@brdY,@brdSize)
		offset=0
				
		tst=MiniMagick::Image.open("test_image.jpg")
		tsts.each do |img|
			tst = tst.composite(img) do |c|
	  			c.compose "Over"    # OverCompositeOp
	  			c.geometry "+0+#{offset}" # copy second_image onto first_image from (20, 20)
	  			offset+=img.height+@brdSize;
			end;	
		end;
		#WriterJPG.new(tst);
		tst
	end;	
end;	

class SideWindow
	attr_accessor :brdX, :brdY

	def initialize
		yield(self) if block_given?
		@brdSize=10;
		@totalX=800-@brdSize*@brdX;
	end;

	def makeCollage(h, v, m)
		puts "Collage type: SIDEWINDOW"

		x1=h.first.width;		y1=h.first.height;
		x2=h.last.width;		y2=h.last.height;
		x3=v.first.width;		y3=v.first.height;


		b=@totalX.fdiv(x2+(x2.fdiv(x1)*y1+y2)*x3.fdiv(y3));
		a=b*(x2.fdiv(x1));
		c=(a*y1+b*y2).fdiv(y3)

		newX1=x1*a;		newY1=y1*a
		newX2=x2*b;		newY2=y2*b
		newX3=x3*c;		newY3=y3*c

		newX=newX1+newX3
		newY=newY3
		bkg=BackGround.new(newX,newY, @brdX,@brdY,@brdSize)

		tst=MiniMagick::Image.open("test_image.jpg")
		img=h.first.resize("#{newX1}x#{newY1}")
			tst = tst.composite(img) do |c|
	  			c.compose "Over"    # OverCompositeOp
	  			c.gravity "northwest"
			end;	
		img=h.last.resize("#{newX2}x#{newY2}")
			tst = tst.composite(img) do |c|
	  			c.compose "Over"    # OverCompositeOp
	  			c.gravity "southwest"
			end;
		img=v.first.resize("#{newX3}x#{newY3}")
			tst = tst.composite(img) do |c|
	  			c.compose "Over"    # OverCompositeOp
	  			c.gravity "east"
			end;		
	end;	

end;

class HakenKreuz
	def makeCollage(h, v, m)
	end;
end;


i=Collager.new(ARGV)

class TopWindow
	def initialize
		#@imgs=imgs
		@brdX=@brdY=3
		puts "*** TopWindow ***"
	end;

	def getRatios(imgs, xSize, brdSize)
		#x=[]; y=[]; 
		a=[]
		#@xy=[]
		imgs.select {|q| q["orientation"]=="Horizontal"}.each do |i| 
			#x<<i["width"]
			#y<<i["height"]
			#@xy<<{"x"=>i["width"], "y"=>i["height"]}
			@imgs<<i
		end;
		imgs.select {|q| q["orientation"]=="Vertical"}.each do |i| 
			#x<<i["width"]
			#y<<i["height"]
			#@xy<<{"x"=>i["width"], "y"=>i["height"]}
			@img<<i
		end;
		#puts x
		#puts y
		#a[2]=xSize.fdiv(x[1]*y[2].fdiv(y[1])+x[2])
		#a[1]=a[2]*y[2].fdiv(y[1])
		@xSize=xSize-2*brdSize;
		a[0]=@xSize.fdiv(@xy[0]["x"])
		@xSize=xSize-brdSize*imgs.size-1-1+2;
		#z=1;
		@imgs.each do |n|
			n["ratio"]=@xSize.fdiv(n["width"]+@imgs.reduce(0){|sum, i| i["width"]*n["height"].fdiv(i["height"])})
		#z+=1;
		end;	
		#puts a;
		#a
		@imgs
	end;	

	def getBrdX
		@brdX
	end;	

	def getBrdY
		@brdY
	end	

	def getBkgSize(imgs, brdSize)
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+brdSize*2
		bkg["height"]=imgs[0]["reducedHeight"]+imgs[1]["reducedHeight"]+brdSize*3
		puts bkg
		bkg
	end;	

	def getGeometry(imgs, brdSize)
		geo=[]
		geo[0]="+#{brdSize}+#{brdSize}"
		z=1
		bigX=0
		#imgs[1..-1].each do
		#x.zip(y).each do |xx,yy|
		@xy.each do |n|
			geo[z]="+#{brdSize*z+bigX}+#{brdSize+@xy[0]['y']+brdSize}"
			bigX=@xy[1..z].reduce(0){|sum, n| sum+n["x"]}
			z+=1
		end;	
		puts geo
		geo
	end;
end;	
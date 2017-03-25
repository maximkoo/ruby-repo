class Square
	def initialize
		#@imgs=imgs
		@brdX=@brdY=3
		puts "*** Square ***"
	end;

	def getRatios(imgs, xSize)
		x=[]; y=[]; a=[]
		imgs.each do |i| 
			x<<i["width"]
			y<<i["height"]
		end;	
		#puts x
		#puts y
		#@xSize=xSize-
		a[1]=xSize*y[1].fdiv(y[0]).fdiv(x[0]+x[1]);
		a[0]=(xSize-a[1]*x[1])*1.fdiv(x[0]);
		a[3]=xSize*y[3].fdiv(y[1]).fdiv(x[2]+x[3]);
		a[2]=(xSize-a[3]*x[3])*1.fdiv(x[2]);
		puts a;
		a
	end;	

	def getBrdX
		@brdX
	end;	

	def getBrdY
		@brdY
	end	

	def getBkgSize(imgs, brdSize)
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+imgs[1]["reducedWidth"]+brdSize*@brdX
		bkg["height"]=imgs[0]["reducedHeight"]+imgs[2]["reducedHeight"]+brdSize*@brdY
		puts bkg
		bkg
	end;

	def getGeometry(imgs, brdSize)
		geo=[]
		geo[0]="+#{brdSize}+#{brdSize}"
		geo[1]="+#{brdSize+imgs[0]['reducedWidth']+brdSize}+#{brdSize}"
		geo[2]="+#{brdSize}+#{brdSize+imgs[0]['reducedHeight']+brdSize}"
		geo[3]="+#{brdSize+imgs[0]['reducedWidth']+brdSize}+#{brdSize+imgs[0]['reducedHeight']+brdSize}"
		puts geo
		geo
	end;	
end;	
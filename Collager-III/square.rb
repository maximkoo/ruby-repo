class Square
	def initialize
		#@imgs=imgs
		@brdX=@brdY=3
		puts "*** Square ***"
	end;

	def getRatios(imgs, xSize, brdSize)
		#x=[]; y=[]; a=[]
		@brdSize=brdSize
		# imgs.each do |i| 
		# 	x<<i["width"]
		# 	y<<i["height"]
		# end;
		@imgs=imgs	
		#puts x
		#puts y
		#@xSize=xSize-
		@imgs[1]["ratio"]=xSize*@imgs[1]["height"].fdiv(@imgs[0]["height"]).fdiv(@imgs[0]["width"]+@imgs[1]["width"]);
		@imgs[0]["ratio"]=(xSize-@imgs[1]["ratio"]*@imgs[1]["width"])*1.fdiv(@imgs[0]["width"]);
		@imgs[3]["ratio"]=xSize*@imgs[3]["height"].fdiv(@imgs[1]["height"]).fdiv(@imgs[2]["width"]+@imgs[3]["width"]);
		@imgs[2]["ratio"]=(xSize-@imgs[3]["ratio"]*@imgs[3]["width"])*1.fdiv(@imgs[2]["width"]);
		#puts a;
		@imgs.each {|i| puts i["ratio"]}
		@imgs
	end;	

	def getBrdX
		@brdX
	end;	

	def getBrdY
		@brdY
	end	

	def getBkgSize(imgs)
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+imgs[1]["reducedWidth"]+@brdSize*@brdX
		bkg["height"]=imgs[0]["reducedHeight"]+imgs[2]["reducedHeight"]+@brdSize*@brdY
		puts bkg
		bkg
	end;

	def getGeometry(imgs, mods)
		@imgs=imgs
		@imgs[0]["geometry"]="+#{@brdSize}+#{@brdSize}"
		@imgs[1]["geometry"]="+#{@brdSize+imgs[0]['reducedWidth']+@brdSize}+#{@brdSize}"
		@imgs[2]["geometry"]="+#{@brdSize}+#{@brdSize+imgs[0]['reducedHeight']+@brdSize}"
		@imgs[3]["geometry"]="+#{@brdSize+imgs[0]['reducedWidth']+@brdSize}+#{@brdSize+imgs[0]['reducedHeight']+@brdSize}"
		@imgs
	end;	
end;	
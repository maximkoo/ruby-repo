class ManyVert
	def initialize
		#@imgs=imgs
		@brdX=3
		@brdY=2
		puts "*** ManyVert ***"
	end;

	def getRatios(imgs, xSize, brdSize)
		@brdX=imgs.size-1+2
		@brdSize=brdSize
		@imgs=imgs
		@imgs[0]["ratio"]=xSize.fdiv(@imgs.reduce(0){|sum, x| sum+imgs.first["height"]*x["width"].fdiv(x["height"])})
		(1..@imgs.size-1).each do |i|
			@imgs[i]["ratio"]=@imgs[0]["ratio"]*@imgs.first["height"].fdiv(@imgs[i]["height"])
		end;	
		@imgs
	end;

	def getBkgSize(imgs)
		bkg=Hash.new
		bkg["width"]=imgs.reduce(0){|sum, m| sum+m["reducedWidth"]}+@brdSize*@brdX
		bkg["height"]=imgs[0]["reducedHeight"]+@brdSize*@brdY
		puts bkg
		bkg
	end;

	def getGeometry(imgs, mods)
		puts "---geometry---"
		@imgs=imgs
		z=0
		bigX=0		
		@imgs.each do |n|
			n["geometry"]="+#{@brdSize*(z+1)+bigX}+#{@brdSize}"
			bigX=@imgs[0..z].reduce(0){|sum, m| sum+m["reducedWidth"]}
			z+=1
			puts n["geometry"]
		end;	
		@imgs
	end;

end;	
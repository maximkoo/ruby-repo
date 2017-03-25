class ManyVert
	def initialize
		#@imgs=imgs
		@brdX=3
		@brdY=2
		puts "*** ManyVert ***"
	end;

	def getRatios(imgs, xSize)
		@brdX=imgs.size-1+2
		x=[]; y=[]; a=[]
		imgs.each do |i| 
			x<<i["width"]
			y<<i["height"]
		end;	
		#puts x
		#puts y
		a[0]=xSize.fdiv(imgs.reduce(0){|sum, x| sum+imgs.first["height"]*x["width"].fdiv(x["height"])})
		z=0
		imgs.each do |i|
			a[z]=a[0]*imgs.first["height"].fdiv(i["height"])
			z+=1
		end;	
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
		bkg["width"]=imgs.reduce(0){|sum, m| sum+m["reducedWidth"]}+brdSize*@brdX
		bkg["height"]=imgs[0]["reducedHeight"]+brdSize*@brdY
		puts bkg
		bkg
	end;

		
end;	
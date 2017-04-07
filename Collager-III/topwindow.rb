class TopWindow
	def initialize
		puts "*** TopWindow ***"
	end;

	def getRatios(imgs, xSize, brdSize)
		@brdSize=brdSize
		@imgs=[]
		imgs.select {|q| q["orientation"]=="Horizontal"}.each do |i| 
			@imgs<<i
		end;
		imgs.select {|q| q["orientation"]=="Vertical"}.each do |i| 
			@imgs<<i
		end;
		@xSize=xSize-2*@brdSize;
		@imgs[0]["ratio"]=@xSize.fdiv(@imgs[0]["width"])
		puts @imgs[0]["ratio"]
		@xSize=xSize-@brdSize*(imgs.select {|q| q["orientation"]=="Vertical"}.size-1+2);
		puts "@xSize=#{@xSize}"
		@imgs.each do |n|
			if n["orientation"]=="Vertical"
				#n["ratio"]=@xSize.fdiv(n["width"]+n["height"]*@imgs.select{|p|p["orientation"]=="Vertical"}.reduce(0){|sum, i| i["width"].fdiv(i["height"])})
				n["ratio"]=@xSize.fdiv(n["height"]*@imgs.select{|p|p["orientation"]=="Vertical"}.reduce(0){|sum, i| sum+i["width"].fdiv(i["height"])})
				puts n["ratio"]
			end;
		end;	
		@imgs
	end;	

	def getBkgSize(imgs)
		puts "---background---"
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+@brdSize*2
		bkg["height"]=imgs[0]["reducedHeight"]+imgs[1]["reducedHeight"]+@brdSize*3
		puts bkg
		bkg
	end;	

	def getGeometry(imgs, mods)
		puts "---geometry---"
		@imgs=imgs
		@imgs[0]["geometry"]="+#{@brdSize}+#{@brdSize}"
		puts @imgs[0]["geometry"]
		z=1
		bigX=0		
		@imgs.each do |n|
			if n["orientation"]=="Vertical"
				n["geometry"]="+#{@brdSize*z+bigX}+#{@brdSize+@imgs[0]['reducedHeight']+@brdSize}"
				bigX=@imgs[1..z].reduce(0){|sum, m| sum+m["reducedWidth"]}
				z+=1
				puts n["geometry"]
			end;	
		end;	
		#puts geo
		@imgs
	end;
end;	
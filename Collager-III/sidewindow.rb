class SideWindow
	def initialize
		puts "*** SideWindow ***"
	end;

	def getRatios(imgs, xSize, brdSize)
		@brdSize=brdSize
		@imgs=[]
		imgs.select {|q| q["orientation"]=="Vertical"}.each do |i| 
			@imgs<<i
		end;
		imgs.select {|q| q["orientation"]=="Horizontal"}.each do |i| 
			@imgs<<i
		end;
		
		@xSize=xSize-3*@brdSize;
		puts "@xSize=#{@xSize}"
		nb=(@imgs.size-2)*@brdSize
		@imgs.each do |n|
			if n["orientation"]=="Horizontal"
				n["ratio"]=(@xSize*@imgs[0]["height"]-nb*@imgs[0]["width"]).fdiv(@imgs[0]["width"]*@imgs.reduce(0){|sum, i| sum+n["width"]*i["height"].fdiv(i["width"])})
				puts n["ratio"]
			end;
		end;	
		
		@imgs[0]["ratio"]=(@xSize-@imgs[2]["ratio"]*@imgs[2]["width"]).fdiv(@imgs[0]["width"])
		puts "[0]:#{@imgs[0]["ratio"]}"
		@imgs
	end;

	def getBkgSize(imgs)
		puts "---background---"
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+imgs[1]["reducedWidth"]+@brdSize*3
		bkg["height"]=imgs[0]["reducedHeight"]+@brdSize*2
		puts bkg
		bkg
	end;	

	def getGeometry(imgs, mods)
		puts "---geometry---"
		@imgs=imgs
		if !mods.include?("--right")
			@imgs[0]["geometry"]="+#{@brdSize}+#{@brdSize}"
			puts @imgs[0]["geometry"]
			z=1
			bigY=0		
			@imgs.each do |n|
				if n["orientation"]=="Horizontal"
					n["geometry"]="+#{@brdSize*2+@imgs[0]["reducedWidth"]}+#{@brdSize*z+bigY}"
					bigY=@imgs[1..z].reduce(0){|sum, m| sum+m["reducedHeight"]}
					z+=1
					puts n["geometry"]
				end;	
			end;	
		else
			z=1
			bigY=0		
			@imgs.each do |n|
				if n["orientation"]=="Horizontal"
					n["geometry"]="+#{@brdSize}+#{@brdSize*z+bigY}"
					bigY=@imgs[1..z].reduce(0){|sum, m| sum+m["reducedHeight"]}
					z+=1
					puts n["geometry"]
				end;	
			end;
			@imgs[0]["geometry"]="+#{@brdSize*2+@imgs[1]["reducedWidth"]}+#{@brdSize}"
			puts @imgs[0]["geometry"]	
		end;	
		@imgs
	end;
end;	
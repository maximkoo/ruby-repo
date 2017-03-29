class HakenKreuz
def initialize
		puts "*** HakenKreuz ***"
		@e=1.1
	end;

def getRatios(imgs, xSize, brdSize)
		@brdSize=brdSize
		@imgs=[]
		@imgs<<imgs.select {|q| q["orientation"]=="Horizontal"}.first 
		@imgs<<imgs.select {|q| q["orientation"]=="Vertical"}.first
		@imgs<<imgs.select {|q| q["orientation"]=="Vertical"}.last 
		@imgs<<imgs.select {|q| q["orientation"]=="Horizontal"}.last
		
		@xSize=xSize-3*@brdSize;
		puts "@xSize=#{@xSize}"

		(0..3).each do |i|
			self.instance_variable_set("@x#{i}", @imgs[i]["width"])
			self.instance_variable_set("@y#{i}", @imgs[i]["height"])
			self.instance_variable_set("@yx#{i}", @imgs[i]["height"].fdiv(@imgs[i]["width"]))
		end;
		@r=@xSize-@xSize.fdiv(@e);
		#@imgs[3]["ratio"]=@r*(@yx0+@yx1).fdiv((@yx2+@yx3)*@x3)
		#@imgs[3]["ratio"]=@r.fdiv(  (1+(@yx2+@yx3).fdiv(@yx0+@yx1) ) *@x3)
		@imgs[3]["ratio"]=(@r+@xSize*(@yx0+@yx2).fdiv(@yx0+@yx1)).fdiv(@x3*(1+((@yx2+@yx3).fdiv(@yx0+@yx1)) ) ) 
		@imgs[1]["ratio"]=(@xSize*(@yx0+@yx2)-@imgs[3]["ratio"]*@x3*(@yx2+@yx3)).fdiv(@x1*(@yx0+@yx1));
		@imgs[0]["ratio"]=(@xSize-@imgs[1]["ratio"]*@x1).fdiv(@x0)
		@imgs[2]["ratio"]=(@xSize-@imgs[3]["ratio"]*@x3).fdiv(@x2)
		@imgs.each do |i|
			puts i["ratio"]
		end;
		@imgs
	end;

	def getBkgSize(imgs)
		puts "---background---"
		bkg=Hash.new
		bkg["width"]=imgs[0]["reducedWidth"]+imgs[1]["reducedWidth"]+@brdSize*4
		bkg["height"]=imgs[0]["reducedHeight"]+imgs[2]["reducedHeight"]+@brdSize*4
		puts bkg
		bkg
	end;	

	def getGeometry(imgs)
		puts "---geometry---"
		@imgs=imgs
		@imgs[0]["geometry"]="+#{@brdSize}+#{@brdSize}"	
		@imgs[1]["geometry"]="+#{@imgs[0]["reducedWidth"]+@brdSize*3}+#{@brdSize}"	
		@imgs[2]["geometry"]="+#{@brdSize}+#{@imgs[0]["reducedHeight"]+@brdSize*3}"	
		@imgs[3]["geometry"]="+#{@imgs[2]["reducedWidth"]+@brdSize*3}+#{@imgs[1]["reducedHeight"]+@brdSize*3}"	
		@imgs.each do |i|
			puts i["geometry"]
		end;	
		@imgs
	end;
end;		
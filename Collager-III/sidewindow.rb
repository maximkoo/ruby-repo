class SideWindow
	def initialize
		#@imgs=imgs
		@brdX=@brdY=3
		puts "*** SideWindow ***"
	end;

	def getRatios(imgs, xSize)
		x=[]; y=[]; a=[]
		imgs.select {|q| q["orientation"]=="Vertical"}.each do |i| 
			x<<i["width"]
			y<<i["height"]
			#puts "Added Image:"+i["image"].path
		end;
		imgs.select {|q| q["orientation"]=="Horizontal"}.each do |i| 
			x<<i["width"]
			y<<i["height"]
			#puts"Added Image:"+ i["image"].path
		end;	
		puts x
		puts y
		a[2]=xSize.fdiv(x[1]+(x[1].fdiv(x[0])*y[0]+y[1])*x[2].fdiv(y[2]));
		a[1]=a[2]*(x[1].fdiv(x[0]));
		a[0]=(a[1]*y[0]+a[2]*y[1]).fdiv(y[2])

		#b=@totalX.fdiv(x2+(x2.fdiv(x1)*y1+y2)*x3.fdiv(y3));
		#a=b*(x2.fdiv(x1));
		#c=(a*y1+b*y2).fdiv(y3)
		puts a;
		a
	end;

	def getBrdX
		@brdX
	end;	

	def getBrdY
		@brdY
	end		
end;	
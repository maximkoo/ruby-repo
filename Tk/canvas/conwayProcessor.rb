class Conway
	def initialize(values, fSize)
		@gf=values
		@fSize=fSize
		@next=Array.new(@fSize){Array.new(@fSize,0)}
	end;	

	def restartNext
 		@next.each do |row|
 			row.fill(0)
 		end
 	end

 	def run
  		@fSize.times do |y|
	  		@fSize.times do |x|
		  		case countAdj(x,y)
			  		when 0,1
			  			@next[y][x]=0
			  		when 2
			  		    @next[y][x]=@gf[y][x]
			  		when 3 
			  		      @next[y][x]=1   
			  		when 4..8
			  			@next[y][x]=0  
			  		else 
			  			puts "OLOLO"	  	
			  	end
	  		end	
  		end
  		@fSize.times do |y|
  			@gf[y].replace(@next[y])
  		end	
  		restartNext	

  		#return an array
  		@gf
	end

	def countAdj(x,y)
  		adj=[self.getCell(x-1,y), self.getCell(x+1,y), self.getCell(x,y-1), self.getCell(x,y+1),
       		self.getCell(x-1,y-1), self.getCell(x+1,y+1), self.getCell(x+1,y-1), self.getCell(x-1,y+1)]
  		#print adj
  		adj.count{|i|i==1}    
	end

	def getCell(x,y)
 		if x<0 then x=@fSize-1 end
 		if y<0 then y=@fSize-1 end
 		if x>=@fSize then x=0	end
 		if y>=@fSize then y=0	end	

 		@gf[y][x]	
	end;

end; #class
class Conway
def initialize
  @fSize=10;	
  @gf=Array.new(@fSize){Array.new(@fSize,0)}
  @next=Array.new(@fSize){Array.new(@fSize,0)}
  self.initialSeed;
end;

def initialSeed
 	@gf[2][1]=1;
 	@gf[2][2]=1;
 	@gf[2][3]=1;
 	@gf[1][3]=1;
 	@gf[0][2]=1;
end;	

def outputCurrent
  @gf.each do |row|
  	print row
  	puts
  end;	
end;

def outputNext
	@next.each do |row|
  	print row
  	puts
  end;
end	

def restartNext
 @next.each do |row|
 	row.fill(0)
 end	
end;	

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
  		end
  	end	
  end
  @fSize.times do |y|
  	@gf[y].replace(@next[y])
  end	
  restartNext	
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

a=Conway.new
#puts a.countAdj(2,0)
#puts a.countAdj(3,0)
#puts "-------"
while cmd=$stdin.gets do
	exit if cmd.chomp=='exit' || cmd.chomp=='quit' || cmd.chomp=='bye' 
	a.outputCurrent
	a.run
	puts
end;


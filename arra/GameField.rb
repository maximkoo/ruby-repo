class GameField
 def initialize
  @fSize=8;
  @colorsUsed=6; ##Количество цветов
  @gf=Array.new(@fSize){Array.new(@fSize,0)};
  @chains=[]
  @allChecked=[]
  @hwm=50; ##Процент окрашенных клеток
  @dropCount=0
  @totalScore=0
  @zeroCount=@fSize*@fSize
 end;

 def getZeroCount
  @zeroCount
 end	

 def getTotalScore
  @totalScore
 end	

 def output
  @fSize.times do |k|
   #print @gf[k].map{|e| e==0? '.':e}
   print @gf[k]
   puts
  end;
 end; 

 def output_f
  print @f
 end

 def outputChains
  @chains.length.times do |k|
   puts "#{@chains[k]} : len=#{@chains[k].length}" if @chains[k].length>2
  end	
  puts
 end	

 def outputAllChecked
  print @allChecked
 end
 
def getRandomVal(hwm)	
  val=Random.new.rand(1..100)
  result=(val % @colorsUsed)+1
  result=0 if val>hwm
  result; 	
end;

def initialSeed(fillPercent)
  @hwm=fillPercent if fillPercent!='default' && fillPercent!=0	
  @fSize.times do |y|
  	@fSize.times do |x|
      @gf[y][x]=getRandomVal(@hwm);
  	end;
  end;	
  setZeroCount	
end;	

def additionalSeed(newCells)
  	#newCells=3; #Количество появляющихся шариков, не менее
  	newCells=[newCells,((@dropCount+1)/2).round].max
  	newCells.times do |t|
   		cnt=0
   		emptyCells=[]
   		@fSize.times do |y|
   			@fSize.times do |x|
   				emptyCells<<[x,y] if @gf[y][x]==0
   			end;	
   		end;	

   			

    	#print "Empty cells: #{emptyCells}"
    	#puts
   		#puts "Zero count= #{emptyCells.length}"
    	cellNum=Random.new.rand(emptyCells.length)
    	puts "CellNum=#{cellNum}"
    	y=emptyCells[cellNum].last
    	x=emptyCells[cellNum].first
    	@gf[y][x]=getRandomVal(1000)
    	print "New cell: #{x}, #{y}, value=#{@gf[y][x]}"
    	puts
    	if emptyCells.size==1
   			abort "GAME OVER"
   		end;
   end;
end;	

def randomSeedImi
 @gf[0]=[0,1,2,3]
 @gf[1]=[3,4,2,0]
 @gf[2]=[2,2,2,3]
 @gf[3]=[0,1,0,3]
end;	

 def move(direction)
  case direction
  when "right"
  	@fSize.times do |k|
  	@gf[k].reject!{|i| i==0}
  		while @gf[k].length<@fSize
    		@gf[k].insert(0,0)
    	end
	end
  when 'left'
  	@fSize.times do |k|
  		@gf[k].reject!{|i| i==0}
  		while @gf[k].length<@fSize 
    		@gf[k]<<0
    	end
	end
  when 'up'
    @gf=@gf.transpose;
    @fSize.times do |k|
  		@gf[k].reject!{|i| i==0}
  		while @gf[k].length<@fSize 
    		@gf[k]<<0
    	end
	end
    @gf=@gf.transpose
  when 'down' then	
  	@gf=@gf.transpose;
    @fSize.times do |k|
  		@gf[k].reject!{|i| i==0}
  		while @gf[k].length<@fSize 
    		@gf[k].insert(0,0)
    	end
	end
    @gf=@gf.transpose
  else 
  	puts 'OLOLO'
  end
end;

def getCell(x,y,where)
 case where 
  when 'upper'
   if y>0 
     @gf[y-1][x]
   else -1  
   end;	
  when 'lower'
   if y<@fSize-1
   	@gf[y+1][x]
   else -1
   end	
  when 'right'
   if x<@fSize-1
   	@gf[y][x+1]
   else -1
   end	
  when 'left'
   if x>0
    @gf[y][x-1]
   else -1
   end 	
  when nil, 'here', 'current'
  	@gf[y][x]
  else -1
  end;		
end;

def checkAdj(x,y)
#print "#{x},#{y}"
#puts
 @f<<[x,y]
 @allChecked<<[x,y]
 if getCell(x,y,'here')==getCell(x,y,'right') && !@f.include?([x+1,y])
  checkAdj(x+1,y)
 end;	
 if getCell(x,y,'here')==getCell(x,y,'left') && !@f.include?([x-1,y])
  checkAdj(x-1,y)
 end;
 if getCell(x,y,'here')==getCell(x,y,'upper') && !@f.include?([x,y-1])
  checkAdj(x,y-1)
 end;
 if getCell(x,y,'here')==getCell(x,y,'lower') && !@f.include?([x,y+1])
  checkAdj(x,y+1)
 end;
end;	

def findChains
 @chains=[]	
 @allChecked=[]
 @fSize.times do |y|
  @fSize.times do |x|
    @f=[]
    if !@allChecked.include?([x,y]) && @gf[y][x]!=0
     	checkAdj(x,y)
    end; 	
    if @f.length>0 
    	@chains<<@f
    end;	
  end;  
 end;	
end;

def dropLongChains
 @dropCount=0	
 score=0
 @chains.length.times do |k|
  if @chains[k].length>=3
    @chains[k].each do |elem|
      @gf[elem.last][elem.first]=0;
      @dropCount+=1
    end;
    score=score+3+(@chains[k].length-3)*3	
  end;	
 end;	
 puts "DropCount=#{@dropCount}"
 puts "Score: #{score}"
 @totalScore+=score
 puts "Total Score: #{@totalScore}"
 setZeroCount()
end;	

def setZeroCount
 @zeroCount=0
 @fSize.times do |k|
   @zeroCount+=@gf[k].count{|i|i==0}
 end;	
end;	

def popCell(x,y)
  @gf[y][x]=0;
end;	
end; #class

#a=GameField.new
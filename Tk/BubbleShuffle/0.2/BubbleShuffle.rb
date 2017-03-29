require 'tk'
require './useful.rb'

class BubbleShuffle
def initialize

	@fSize=8;
	@bubbleSize=60
	@gapSize=10
	#@shift=@gapSize/2
	@colorsUsed=6; ##Количество цветов
  	#@colorsUsed=10; ##Количество цветов
  	@newCellsNumber=5#6 #минимальное количество появляющихся шариков
  	@criticalChainLen=3 #длина цепочки, которая сбрасывается
  	@animateDelay=50 #задержка при анимации в мс
  	@values=Array.new(@fSize){Array.new(@fSize,0)};
  	@bubbles=Array.new(@fSize){Array.new(@fSize,0)};
  	@chains=[]
  	@allChecked=[]
 	@hwm=50; ##Процент окрашенных клеток
 	#@hwm=90; ##Процент окрашенных клеток
  	@turnNumber=1
  	@dropCount=0
  	@totalDropCount=0
  	@totalScore=0
  	@zeroCount=@fSize*@fSize

	@colors=Useful.getColors
	@smalls=Useful.getSmalls
	arrows=Useful.getArrows
	@isBlocked=false
	@isGameOver=false

	@root1 = TkRoot.new {title "Bubble Shuffle"; padx 10; pady 10;}
	myicon = TkPhotoImage.new('file' => './gif/red.gif')
	@root1.iconphoto(myicon)

	#frame1=TkFrame.new(@root).grid :column => 0, :row => 0
	TkGrid.columnconfigure( @root1, 0, :weight => 10 )
	TkGrid.rowconfigure( @root1, 0, :weight => 100 )
	#TkGrid.columnconfigure( @root1, 1, :weight => 1 )

	@cnv1=TkCanvas.new(@root1){background 'gray'}.grid :sticky => 'nwes', :column => 0, :row => 0
	@cnv1['width']=@fSize*@bubbleSize# +@fSize*@gapSize#+@gapSize;
	@cnv1['height']=@fSize*@bubbleSize# +@fSize*@gapSize#+@gapSize;
	
	@frame1=TkFrame.new(@root).grid :sticky => 'nwes', :column => 1, :row => 0
	TkGrid.columnconfigure( @frame1, 0, :weight => 10 )
	TkGrid.rowconfigure( @frame1, 0, :weight => 100 )
	TkGrid.rowconfigure( @frame1, 1, :weight => 100 )
	TkGrid.rowconfigure( @frame1, 2, :weight => 100 )
	TkGrid.rowconfigure( @frame1, 3, :weight => 100 )
	TkGrid.rowconfigure( @frame1, 4, :weight => 100 )
	TkGrid.rowconfigure( @frame1, 5, :weight => 100 )

	@labelTurn =TkLabel.new(@frame1){text Useful.getTurn(1); font 'TkFixedFont'}.grid  :sticky => 'nw', :column => 0, :row => 0, :padx=>20
	@labelDropd=TkLabel.new(@frame1){text Useful.getDropd(0); font 'TkFixedFont'}.grid 		     :sticky => 'nw', :column => 0, :row => 1, :padx=>20
	@labelScore=TkLabel.new(@frame1){text Useful.getScore(0); font 'TkFixedFont'}.grid 	         :sticky => 'nw', :column => 0, :row => 2, :padx=>20
	@labelTotalDropd=TkLabel.new(@frame1){text Useful.getTotalDropd(0); font 'TkFixedFont'}.grid :sticky => 'nw', :column => 0, :row => 3, :padx=>20
	@labelTotalScore=TkLabel.new(@frame1){text Useful.getTotalScore(0); font 'TkFixedFont'}.grid :sticky => 'nw', :column => 0, :row => 4, :padx=>20
	
	@frame2=TkFrame.new(@frame1).grid :sticky => 'nw', :column => 0, :row => 5, :padx=>20

	arrowProcs=Hash.new
	arrowProcs={'up'=>proc{btnClick('up')}, 'left'=>proc{btnClick('left')}, 'right'=>proc{btnClick('right')}, 'down'=>proc{btnClick('down')},}
	
	@btnUp=TkButton.new(@frame2){text "Up"; image arrows["up"]; command arrowProcs["up"]}.grid :column => 1, :row => 0
	@btnLeft=TkButton.new(@frame2){text "Left"; image arrows["left"]; command arrowProcs["left"]}.grid :column => 0, :row => 1
	@btnRight=TkButton.new(@frame2){text "Right"; image arrows["right"]; command arrowProcs["right"]}.grid :column => 2, :row => 1
	@btnDown=TkButton.new(@frame2){text "Down"; image arrows["down"]; command arrowProcs["down"]}.grid :column => 1, :row => 2

	@root1.bind('KeyPress-Up', arrowProcs["up"])
	@root1.bind('KeyPress-Left', arrowProcs["left"])
	@root1.bind('KeyPress-Right', arrowProcs["right"])
	@root1.bind('KeyPress-Down', arrowProcs["down"])

end
	
	def setBlocked(value)
		@isBlocked=value
		if value==false
			btnState('normal')
		end;
		if value==true
			btnState('disable')
		end;	
	end	

	def getRandomVal(hwm)	
  		val=Random.new.rand(1..100)
  		result=(val % @colorsUsed)+1
  		result=0 if val>hwm
  		result; 	
	end;

	def gameOver
		gmovr=TkcImage.new(@cnv1,@cnv1['width']/2,@cnv1['height']/2) {image Useful.getGameOver}
		
		rstrt=proc {puts "RESTART"; 
			     	gmovr['image']=nil;
			 	 	restart;
			 		}
		@root1.bind("Key", proc{|k| if k=="Return" || k=='space' then rstrt.call; end; }, "%K")
		gmovr.bind("1", rstrt )
		#gmovr.bind("KeyPress-Enter", rstrt )

	end;	

	def additionalSeed(newCells)
  		emptyCells=[]
  		#newCells=[newCells,((@dropCount+1)/2).round].max
  		newCells=2+Random.rand(5).round
  		puts "new bubbles: #{newCells}"
  		newCells.times do |t|
   			cnt=0
   			emptyCells.clear
   			@fSize.times do |y|
   				@fSize.times do |x|
   					emptyCells<<[x,y] if @values[y][x]==0
   				end;	
   			end;	
    		if emptyCells.length>0 
	    		cellNum=Random.new.rand(emptyCells.length)
	    		#puts "CellNum=#{cellNum}"
	    		y=emptyCells[cellNum].last
	    		x=emptyCells[cellNum].first
	    		@values[y][x]=getRandomVal(1000)
	    		animateAppear(x,y,@values[y][x])
	    		emptyCells.delete([x,y])
    		end;
    		#print "New cell: #{x}, #{y}, value=#{@values[y][x]}"
    		#puts
    		if emptyCells.size<=0
   				#abort "GAME OVER"
   				#btnState("disable")
   				setBlocked(true)
   				puts "Game Over"
   				gameOver;
   				break;
   			end;
   		end;
   		emptyCells.size
	end;	

	def initialSeed(fillPercent)
  		@hwm=fillPercent if fillPercent!='default' && fillPercent!=0	
  		@fSize.times do |y|
  			@fSize.times do |x|
      			@values[y][x]=getRandomVal(@hwm);
      			animateAppear(x,y,@values[y][x])
  			end;
  		end;	
  		setZeroCount	
	end;	

	def randomSeedImi
 		@fSize.times do |x|
			@fSize.times do |y|
				@values[y][x]=[Random.new.rand(10).round-5,0].max
			end
		end		
	end;

	def drawBubbles
		#ballImage=TkPhotoImage.new(:file => "./gif/blank.gif")
		ballImage=@colors[0]
		@fSize.times do |x|
			@fSize.times do |y|
				@bubbles[x][y]=TkcImage.new(@cnv1, x*@bubbleSize+@bubbleSize/2,y*@bubbleSize+@bubbleSize/2){image ballImage}
				#puts "x=#{x}, y=#{y}"
			end;
		end;	
	end;	

	def refillBubbles
		@fSize.times do |y|
			@fSize.times do |x|
				@bubbles[x][y]['image']=@colors[@values[y][x]]
			end
		end		
	end	

	def btnState(state)
		[@btnUp, @btnDown, @btnRight, @btnLeft].each do |item|
			item.state(state)
		end;
		[@btnUp, @btnDown, @btnRight, @btnLeft].each do |item|
			item.state(state)
		end			
	end
		
	def btnClick(direction)
		#btnState('disable')
		return if @isBlocked
		setBlocked(true)
		move(direction)
		refillBubbles
		Tk.after(200) do
			findChains
			dropLongChains
			#refillBubbles
		#end	
			Tk.after(400) do
				emptyCellsLeft=additionalSeed(@newCellsNumber)
				#refillBubbles
				#btnState('normal')
				puts "btnClick: #{emptyCellsLeft}"
				setBlocked(false) if emptyCellsLeft>0 
			end;
		end;
		
		
	end	

	def move(direction)
  		case direction
  		when "right"
	  	@fSize.times do |k|
	  	@values[k].reject!{|i| i==0}
	  		while @values[k].length<@fSize
	    		@values[k].insert(0,0)
	    	end
		end
	  when 'left'
	  	@fSize.times do |k|
	  		@values[k].reject!{|i| i==0}
	  		while @values[k].length<@fSize 
	    		@values[k]<<0
	    	end
		end
	  when 'up'
	    @values=@values.transpose;
	    @fSize.times do |k|
	  		@values[k].reject!{|i| i==0}
	  		while @values[k].length<@fSize 
	    		@values[k]<<0
	    	end
		end
	    @values=@values.transpose
	  when 'down' then	
	  	@values=@values.transpose;
	    @fSize.times do |k|
	  		@values[k].reject!{|i| i==0}
	  		while @values[k].length<@fSize 
	    		@values[k].insert(0,0)
	    	end
		end
	    @values=@values.transpose
	  else 
	  	puts 'OLOLO'
	  end
	end;

	def getCell(x,y,where)
	 case where 
	  when 'upper' then if y>0 then @values[y-1][x]; else -1; end;	
	  when 'lower' then if y<@fSize-1 then @values[y+1][x]; else -1; end;	
	  when 'right' then if x<@fSize-1 then @values[y][x+1]; else -1; end;	
	  when 'left'  then if x>0 then @values[y][x-1]; else -1; end; 	
	  when nil, 'here', 'current' then @values[y][x]; else -1; end;		
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
    			if !@allChecked.include?([x,y]) && @values[y][x]!=0
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
	  		if @chains[k].length>=@criticalChainLen
	    		@chains[k].each do |elem|
	      			animateDrop(elem.first, elem.last, @values[elem.last][elem.first])
	      			@values[elem.last][elem.first]=0;	      			
	      			@dropCount+=1
	    		end;
	    		score=score+@criticalChainLen+(@chains[k].length-@criticalChainLen)*@criticalChainLen	
	  		end;	
 		end;	
 		#puts "DropCount=#{@dropCount}"
 		#puts "Score: #{score}"
 		@totalScore+=score
 		@totalDropCount+=@dropCount
 		#puts "Total Score: #{@totalScore}"
 		@turnNumber+=1
 		refreshInfo(score)
	end;

	def animateDrop(x,y, value)
		#t=Thread.new do 
		Tk.after(@animateDelay) do
			@bubbles[x][y]['image']=@smalls[value]
			Tk.after(@animateDelay) do
				@bubbles[x][y]['image']=@colors[0]
			end;
		#end;		
		end;	
	end;	

	def animateAppear(x,y,value)
		#t=Thread.new do 
		Tk.after(@animateDelay) do
			@bubbles[x][y]['image']=@smalls[value]
			Tk.after(@animateDelay) do
				@bubbles[x][y]['image']=@colors[value]
			end;
		#end;		
		end;
	end;	

	def refreshInfo(score)
		@labelTurn["text"]		=Useful.getTurn(@turnNumber)
 		@labelDropd["text"]		=Useful.getDropd(@dropCount)
 		@labelTotalDropd["text"]=Useful.getTotalDropd(@totalDropCount)
 		@labelScore["text"]		=Useful.getScore(score)
 		@labelTotalScore["text"]=Useful.getTotalScore(@totalScore)
 		setZeroCount()
	end;	

	def setZeroCount
		@zeroCount=0
 		@fSize.times do |k|
   			@zeroCount+=@values[k].count{|i|i==0}
 		end;	
	end;	

	def restart
		@values.each do |row|
			row.fill(0)
		end;	
		#refillBubbles;
		@turnNumber=1;
		@dropCount=0;
		@totalDropCount=0;
		score=0;
		@totalScore=0;
		refreshInfo(score);
		setZeroCount; #?
		initialSeed(0);
		setBlocked(false)
		p1=proc{}
		@root1.bind("Key", p1, "%K")
	end;	

	def popCell(x,y)
  		@values[y][x]=0;
		end;	
end; #class

gf=BubbleShuffle.new
gf.randomSeedImi
gf.drawBubbles
#gf.randomSeedImi
gf.initialSeed(0)
#gf.refillBubbles
Tk.mainloop
require 'tk'
require './conwayProcessor.rb'

class GameField
	def initialize
		@colors=["blue","red"]
		@fSize=20; #Размер поля x*x
		@cSize=20; #Размер клеточки
		@gapSize=5; #Размер промежутка между клеточками
		@values=Array.new(@fSize) { Array.new(@fSize,0)} #Значения 0/1
		@cells=Array.new(@fSize) { Array.new(@fSize,0)} #Сами клеточки
		@isRunning=false; # Запущено?
		@doOutput=false; # Выводить отладку?

		@root1 = TkRoot.new {title "The ultimate cells game"; padx 10; pady 10;}
		myicon = TkPhotoImage.new('file' => 'pic.gif')
		@root1.iconphoto(myicon)

		#frame1=TkFrame.new(@root).grid :column => 0, :row => 0
		TkGrid.columnconfigure( @root1, 0, :weight => 10 )
		TkGrid.rowconfigure( @root1, 0, :weight => 100 )
		TkGrid.columnconfigure( @root1, 1, :weight => 1 )

		@cnv1=TkCanvas.new(@root1).grid :sticky => 'nwes', :column => 0, :row => 0
		@cnv1['width']=@fSize*@cSize+@fSize*@gapSize+@gapSize;
		@cnv1['height']=@fSize*@cSize+@fSize*@gapSize+@gapSize;
		
		@frame1=TkFrame.new(@root).grid :sticky => 'nwes', :column => 1, :row => 0
		TkGrid.columnconfigure( @frame1, 0, :weight => 10 )
		TkGrid.rowconfigure( @frame1, 0, :weight => 100 )
		TkGrid.rowconfigure( @frame1, 1, :weight => 100 )

		startCmd=proc {startBtnClick}
		@startBtn=TkButton.new(@frame1){text "Start"; command startCmd}.grid :column => 0, :row => 0, :padx => 50, :pady=>20
		
		@startImage = TkPhotoImage.new(:file => "Start.gif")
		@stopImage = TkPhotoImage.new(:file => "Stop.gif")
		@startBtn['image'] = @startImage	

		cleanCmd=proc {cleanBtnClick}
		cleanBtn=TkButton.new(@frame1){text "Clean"; command cleanCmd}.grid :column => 0, :row => 1, :padx => 50, :pady=>20
		cleanImage = TkPhotoImage.new(:file => "Clean.gif")
		cleanBtn['image'] = cleanImage
	end

	def drawCells
		@fSize.times do |y|
		  @fSize.times do |x|
		  	#q[y*@fSize+x]=
		  	@cells[x][y]=TkcRectangle.new(@cnv1, @gapSize+x*(@cSize+@gapSize), 
		  							 @gapSize+y*(@cSize+@gapSize), 
		  							 @gapSize+x*(@cSize+@gapSize)+@cSize, 
		  							 @gapSize+y*(@cSize+@gapSize)+@cSize, 
		  							 :fill => 'blue')
		  	@cells[x][y].bind("1", proc {setColor(x,y)})
		  end	
		end	
	end

	def refillCells
		@fSize.times do |y|
		  	@fSize.times do |x|
		  			@cells[x][y]["fill"]=@colors[@values[y][x]]
		  	end
		end;  		
	end	

	def runLife
		if @isRunning
			a=Conway.new(@values, @fSize)
			@values=a.run
			outputValues;
			refillCells			
		end
=begin
		t = Thread.new do
		  loop do
		    puts @isRunning
		    break if !@isRunning	
		    a=Conway.new(@values, @fSize)
			@values=a.run
			outputValues;
			refillCells
		    sleep(1.seconds)
		    redo
		  end
		end		
		t.join
=end
	end;	

	def startBtnClick
		#runLife
# =begin	
 		@isRunning=!@isRunning	
 		#puts "Clicked #{@isRunning}"
		if @isRunning 
			@startBtn['image']=@stopImage
			#runLife
		else 
			@startBtn['image']=@startImage
		end;	
		
# =end		
	end	

	def cleanBtnClick
		@values.each do |row|
 		row.fill(0)
 		end
 		refillCells
	end	

	def outputValues
		return if !@doOutput
		@fSize.times do |k|
			print @values[k]
			puts
		end	
	end	

	def setColor (x,y)
		print "#{x},#{y}\n" if @doOutput
		#puts 
		case @values[y][x]
		when 1 
			@values[y][x]=0
			@cells[x][y]['fill']=@colors[0]
		when 0
			@values[y][x]=1
			@cells[x][y]['fill']=@colors[1]
		else puts "ololo!"
		end		

		outputValues
	end
end; #class	

gf=GameField.new
gf.drawCells
x=proc{gf.runLife}
tm = TkTimer.new(250, -1,x)
tm.start(0)
Tk.mainloop
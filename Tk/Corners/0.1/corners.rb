require 'tk'

class GameField
	def initialize(xSize, ySize)
		@xSize=xSize
		@ySize=ySize
		@values=Array.new(@ySize){Array.new(@xSize,0)};
	end

	def applyCells(stillCoords, movingCoords)
		@values.size.times do |j|
			@values[j].fill(0)
		end;
		stillCoords.each do |st|
			@values[st.last][st.first]=1
		end;
		movingCoords.each do |mv|
			@values[mv.last][mv.first]=2
		end;	
	end;

	def outputValues
		puts "--- OUTPUT ---"
		@values.each do |row|
			row.each do |cell|
				print cell
			end;	
			puts
		end	
		puts "--- OVER ---"
	end;	
end;

class Still
	def initialize
		@cellCoords=Array.new

		addCells([0,17]);
		addCells([1,17]);
		addCells([2,17]);
		addCells([3,17]);

		print "Still #{@cellCoords}"
		puts
	end

	def getCellCoords
		@cellCoords;
	end;	

	def addCells(newCell)
		@cellCoords<<newCell
	end;	
end;

class Moving
	def initialize(position, xSize, ySize)
		@cellCoords=Array.new
		@xSize=xSize
		@ySize=ySize
		case position 
			when 'top'    
				@xSpeed=0;  
				@ySpeed=1; 
			when 'left'
				@xSpeed=-1; 
				@ySpeed=0; 
			when 'right'
				@xSpeed=1;  
				@ySpeed=0;
			when 'bottom'
				@xSpeed=0;  
				@ySpeed=-1; 
		end;
		puts "xSpeed=#{@xSpeed}"
		puts "ySpeed=#{@ySpeed}"
		generateCorner;
	end

	def getCellCoords
		@cellCoords;
	end;	

	def getSpeed
		sa={"xSpeed"=>@xSpeed,"ySpeed"=>@ySpeed}
		sa
	end;	

	def generateCorner
		x=Random.new.rand(@xSize)
		@cellCoords<<[x,0]
		@cellCoords<<[x+1,0]
		@cellCoords<<[x+1,1]
		#print @cellCoords
		puts
	end	

	def move
		#puts "move"
		#puts @xSize
		#puts @ySize
		@cellCoords.size.times do |i|
			@cellCoords[i]=[@cellCoords[i].first+@xSpeed,@cellCoords[i].last+@ySpeed]
		end;	
		#@cellCoords.delete_if {|cell| cell.first<0 || cell.first>@xSize/2 ||cell.last<0 || cell.last>@ySize/2 }
		print "Move: cell coords: #{@cellCoords}"
		print " Total cells=#{@cellCoords.size}"
		puts 
	end;	

	#def getNoWay
	#	@noWay
	#end;	
end;

class Control1
	def initialize
		@xSize=20
		@ySize=20
		@gf=GameField.new(@xSize, @ySize)
		@still=Still.new
		x=proc{self.runStep}
		tm = TkTimer.new(250, -1,x)
		tm.start(0)
	end

	def runStep
		puts "*** NEW TURN ***"
		
		position='top'
		if not(@moving) 
			puts "(re)Created"
			@moving=Moving.new(position, @xSize, @ySize)
		#else
		#	puts "Moving already exists"
		end;
		
		
		@gf.applyCells(@still.getCellCoords, @moving.getCellCoords)
		@gf.outputValues
		##
		if self.checkCollision
			self.movingToStill;
		end;	

		##
		@moving.move if @moving
		##
	end;	

	def checkCollision
		isCollision=false;
		speed=@moving.getSpeed;
		@moving.getCellCoords.each do |cell|
			if @still.getCellCoords.count{|st| st.first==cell.first+speed["xSpeed"] && st.last==cell.last+speed["ySpeed"]}>0
				isCollision=true;
				print "isCollision-1: #{cell}"
				puts
			end;

			if  speed["xSpeed"]==0 && speed["ySpeed"]>0  && cell.last+speed["ySpeed"] >@ySize/2 || #vertical down
 				speed["xSpeed"]==0 && speed["ySpeed"]<0  && cell.last+speed["ySpeed"] <@ySize/2 || #vertical up
 				speed["xSpeed"]<0  && speed["ySpeed"]==0 && cell.first+speed["xSpeed"]<@xSize/2 || #horizontal left
				speed["xSpeed"]>0  && speed["ySpeed"]==0 && cell.first+speed["xSpeed"]>@xSize/2    #horizontal right
				isCollision=true;
				print "isCollision-2: #{cell}"
				puts
			end;
			
			#if cell.first<0 cell.first>@xSize/2 ||cell.last<0 || cell.last>@ySize/2
			#	isCollision=true;
			#	print "isCollision-2: #{cell}"
			#	puts
			#end;	
		end;
		isCollision
	end;	

	def movingToStill
		@moving.getCellCoords.each do |cell|
			@still.addCells(cell)
		end;	
		@moving=nil;
	end;	
end;		

c=Control1.new
Tk.mainloop;
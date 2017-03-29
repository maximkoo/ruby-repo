require 'tk'

class Corners
def initialize
	@xSize=20
	@ySize=20
	@cellSize=20

	@xSpeed=0
	@ySpeed=-1

	@values=Array.new(@ySize){Array.new(@xSize,0)};
  	@moving=Array.new
  	@cells=Array.new(@ySize){Array.new(@xSize,0)};


	@root1 = TkRoot.new {title "Corners"; padx 10; pady 10;}
	myicon = TkPhotoImage.new('file' => './icon.gif')
	@root1.iconphoto(myicon)

	@cnv1=TkCanvas.new(@root1){background 'gray'}.grid :sticky => 'nwes', :column => 0, :row => 0
	@cnv1['width']=@xSize*@cellSize
	@cnv1['height']=@ySize*@cellSize

	@blank=TkPhotoImage.new(:file => "./blank1.gif")
	@brick=TkPhotoImage.new(:file => "./brick.gif")
end

	def refillBricks
		@ySize.times do |y|
			@xSize.times do |x|
				#@cells[x][y]['image']=@colors[@values[y][x]]
				if @values[y][x]==1 
					puts "x=#{x}, y=#{y}"
					@cells[x][y]['image']=@brick
				end	
				i=0
			end
		end		
	end	

	def setBrickImi
		@values[0][0]=1
		@values[0][1]=1
		@values[1][1]=1
		#@moving<<[0,0]
		#@moving<<[0,1]
		#@moving<<[1,1]
	end

	def drawBubbles
		#ballImage=TkPhotoImage.new(:file => "./gif/blank.gif")
		ballImage=@blank #@colors[0]
		@xSize.times do |x|
			@ySize.times do |y|
				@cells[x][y]=TkcImage.new(@cnv1, x*@cellSize+@cellSize/2,y*@cellSize+@cellSize/2){image ballImage}
				#puts "x=#{x}, y=#{y}"
			end;
		end;	
	end;	

	def reCalc
		#@moving.each do 

		#end;	
	end;	
end; #of class

c=Corners.new
c.drawBubbles
c.setBrickImi
c.refillBricks

#x=proc{gf.runLife}
#tm = TkTimer.new(250, -1,x)
#tm.start(0)


Tk.mainloop
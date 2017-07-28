require 'tk'
require './moving.rb'
require './shapes.rb'
require './arrayExtention.rb'

class Array
	include ArrayExtention
end;

class GameField
	#@@shapeTypes=[TShape,Stick,SLeft,SRight,CornerLeft,CornerRight,Cube];
	@@cubeSize=10
	@@gfSizeInCubes={width:10, height:20}
	@@gfSizeInPixels={width:(@@gfSizeInCubes[:width]*@@cubeSize).to_s, height:(@@gfSizeInCubes[:height]*@@cubeSize).to_s}
	
	def initialize
		@root = TkRoot.new {title "Hello Tk!"; padx 1; pady 1}
		
		@cnv1=TkCanvas.new(@root, @@gfSizeInPixels){background ('gray')}
		@cnv1.grid(sticky:'nws', column:0, row:0, rowspan:2)

		TkButton.new(@root, :text=>"Shuffle!",:command=>proc{startTimer}).grid :sticky => 'e', :column => 1, :row => 0, :padx=>20
		TkButton.new(@root, :text=>"Close!",:command=>proc{@root.destroy}).grid :sticky => 'e', :column => 1, :row => 1, :padx=>20

		@root.bind('KeyPress-Left', proc{@r.moveLeft})
		@root.bind('KeyPress-Right', proc{@r.moveRight})
		@root.bind('KeyPress-Up', proc{@r.rotate})

		makeRound
		@tm = TkTimer.new(1000, -1,proc{makeMove})
		@tm.start(0)
	end;

	def startTimer
		@tm.start(0)
	end;

	def makeRound
		@r=Moving.getShape
		puts @r.class
	end;
		
	def makeMove
		@r.moveDown
		@root.update
	end	

	def recalcFigures

	end;	
end;
gf=GameField.new
Tk.mainloop
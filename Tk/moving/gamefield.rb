require 'tk'
require './moving.rb'

class GameField
	def initialize
		@root = TkRoot.new {title "Hello Tk!"; padx 1; pady 1}
		@cnv1=TkCanvas.new(@root, :width=>"200",:height=>"500"){background 'gray'}.grid :sticky => 'nws', :column => 0, :row => 0, :rowspan=>2
		TkButton.new(@root, :text=>"Shuffle!",:command=>proc{startTimer}).grid :sticky => 'e', :column => 1, :row => 0, :padx=>20
		TkButton.new(@root, :text=>"Close!",:command=>proc{@root.destroy}).grid :sticky => 'e', :column => 1, :row => 1, :padx=>20
		@r=Moving.new(@cnv1);
		@root.bind('KeyPress-Left', proc{@r.moveLeft})
		@root.bind('KeyPress-Right', proc{@r.moveRight})
		@root.bind('KeyPress-Up', proc{@r.rotate})
		@tm = TkTimer.new(1000, -1,proc{makeTurn})
	end;

	def startTimer
		@tm.start(0)
	end;

	def makeTurn
		#puts @r.coords
		@r.moveDown
		@root.update
	end	
end;
gf=GameField.new
Tk.mainloop
require 'tk'
class HoverMeOver
	def initialize
		@root1 = TkRoot.new {title "Hello Tk!"; padx 0; pady 0}
		@cnv1=TkCanvas.new(@root1){background 'red'}.grid :sticky => 'nwse', :column => 1, :row => 1
		TkGrid.rowconfigure(@root1, 0, :weight => 200 )
		TkGrid.rowconfigure(@root1, 1, :weight => 100 )
		TkGrid.rowconfigure(@root1, 2, :weight => 200 )

		TkGrid.columnconfigure(@root1, 0, :weight => 200 )
		TkGrid.columnconfigure(@root1, 1, :weight => 100 )
		TkGrid.columnconfigure(@root1, 2, :weight => 200 )

		@thr=0
		@lbl=TkLabel.new(@root, :text=>@thr.to_s).grid :column => 1, :row => 0
		@speedlbl=TkLabel.new(@root, :text=>@thr.to_s).grid :column => 2, :row => 0

		@r=TkcRectangle.new(@cnv1, 100,100,200,200, :fill=>"white");

		#TkButton.new(@root, :text=>"Shuffle!",:command=>proc{shuffle}).grid :sticky => 'e', :column => 0, :row => 0, :padx=>50
		#@cnv1.bind("B1-Motion", proc{throttle})
		@cnv1.bind("1", proc{startTimer})
		@cnv1.bind("ButtonRelease-1", proc{stopTimer})

		@tm = TkTimer.new(100, -1,proc{throttle})
		#tm.start(0)
		#tm.stop
		@v=0
		#ll=TkcLine.new(@cnv1, 10,10,50,50, :fill=>"black", :arrow=>"both")
		Tk.mainloop
	end;

	def startTimer
		@tm.start(0)
	end;	

	def stopTimer
		@tm.stop
		@v=0
		@speedlbl["text"]=@v.to_s
	end;	

	def throttle
		
		acc=0.5
		@v=@v+acc
		@thr+=@v
		@lbl["text"]=@thr.to_s
		@speedlbl["text"]=@v.to_s
		@r.move(1,0)
	end;	

end;
myCoolInstance=HoverMeOver.new

